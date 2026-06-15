provider "oci" {
  # Aqui ficaria a configuração do provedor OCI.
  # Se você usa um arquivo config padrão (~/.oci/config), nem precisa colocar mais nada.
  # Caso queira trocar de região ou perfil, pode adicionar: region, tenancy_ocid, user_ocid, etc.
}

# Consulta a imagem mais recente do Oracle Linux 8, compatível com o shape definido

data "oci_core_images" "oracle_linux" {
  compartment_id              = var.compartment_ocid
  operating_system            = "Oracle Linux"
  operating_system_version    = "8"
  shape                       = var.shape
  most_recent                 = true
}

# Cria duas instâncias com base na imagem Oracle Linux 8
# Elas vão rodar um script Cloud-Init que instala o Nginx e personaliza a página

resource "oci_core_instance" "web" {
  count                  2
  availability_domain   = var.availability_domain
  compartment_id        = var.compartment_ocid
  shape                 = var.shape
  subnet_id             = var.subnet_ocid
  display_name          = "web-${count.index + 1}" # nomes como web-1, web-2

  metadata = {
    ssh_authorized_keys   = var.ssh_public_key
    user_data             = base64encode(file("${path.module}/cloud-init/script.yaml")) # Cloud-Init script
  }

  source_details {
    source_type   = "image"
    image_id      = data.oci_core_images.oracle_linux.images[0].id
  }
}

# Cria o Load Balancer na subnet pública definida

resource "oci_load_balancer_load_balancer" "lb" {
  compartment_id   = var.compartment_ocid
  display_name     = "web-lb"
  shape            = "flexible"

  shape_details {
    minimum_bandwidth_in_mbps   = 10
    maximum_bandwidth_in_mbps   = 100
  }

  subnet_ids   = [var.lb_subnet_ocid]
}

# Backend Set define o grupo de servidores que o LB vai usar e como ele faz o balanceamento

resource "oci_load_balancer_backend_set" "backend_set" {
  name               = "web-backend-set"
  load_balancer_id   = oci_load_balancer_load_balancer.lb.id
  policy             = "ROUND_ROBIN" # Alterna entre os servidores de forma igual

  # Health check básico pra garantir que só backends saudáveis recebam tráfego
  health_checker {
    protocol              = "HTTP"
    url_path              = "/"
    port                  = 80
    retries               = 3
    timeout_in_millis     = 3000
    interval_in_millis    = 10000
  }
}

# Liga cada uma das VMs ao Load Balancer como backend

resource "oci_load_balancer_backend" "backends" {
  count               = 2
  load_balancer_id    = oci_load_balancer_load_balancer.lb.id
  backend_set_name    = oci_load_balancer_backend_set.backend_set.name
  ip_address          = oci_core_instance.web[count.index].private_ip
  port                = 80
  backup              = false
  drain               = false
  offline             = false
  weight              = 1
}

# Listener HTTP: escuta na porta 80 e direciona pro backend set configurado

resource "oci_load_balancer_listener" "http_listener" {
  load_balancer_id            = oci_load_balancer_load_balancer.lb.id
  name                        = "http"
  default_backend_set_name    = oci_load_balancer_backend_set.backend_set.name
  port                        = 80
  protocol                    = "HTTP"
}
