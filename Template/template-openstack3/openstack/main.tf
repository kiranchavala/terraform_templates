provider "kubectl" {
 host = var.host
 cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
 load_config_file       = false
 client_certificate =  base64decode(var.client_certificate)
 client_key = base64decode(var. client_key)
}

resource "kubectl_manifest" "test2" {
      yaml_body = base64decode(var.yaml_body)
}


