

provider "kubectl" {
 host = var.host
 cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
 load_config_file       = false
 client_certificate =  base64decode(var.client_certificate)
 client_key = base64decode(var. client_key)
}


resource "kubectl_manifest" "test2" {
        yaml_body = templatefile("${path.module}/deployment.tpl", {
        image_name = var.image_name
        replicas = var.replicas
        container_port = var.container_port 
        container_name = var.container_name

})
}


