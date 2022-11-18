provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}

data "aws_eks_cluster" "example"{
  name = var.cluster_name 
}

data "aws_eks_cluster_auth" "example" {
  name = var.cluster_name 
}

provider "kubectl" {
  host                   = data.aws_eks_cluster.example.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.example.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.example.token
  load_config_file       = false
}

resource "kubectl_manifest" "test2" {
      yaml_body = templatefile("${path.module}/deployment.tpl", {
        image_name = var.image_name
        replicas = var.replicas
        container_port = var.container_port 
        container_name = var.container_name
  })
}