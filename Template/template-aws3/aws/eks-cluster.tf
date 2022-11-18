#
# EKS Cluster Resources
#  * IAM Role to allow EKS service to manage other AWS services
#  * EC2 Security Group to allow networking traffic with EKS cluster
#  * EKS Cluster
#

resource "aws_iam_role" "demo-cluster" {
  name = "terraform-eks-cluster-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "demo-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.demo-cluster.name
}

resource "aws_iam_role_policy_attachment" "demo-cluster-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.demo-cluster.name
}

resource "aws_security_group" "demo-cluster" {
  name        = "terraform-eks-security-group"
  description = "Cluster communication with worker nodes"
  vpc_id      = aws_vpc.demo.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-eks-cluster"
  }
}

resource "aws_security_group_rule" "demo-cluster-ingress-workstation-https" {
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow workstation to communicate with the cluster API Server"
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.demo-cluster.id
  to_port           = 0
  type              = "ingress"
}



resource "aws_eks_cluster" "demo" {
  name     = var.cluster-name
  role_arn = aws_iam_role.demo-cluster.arn

  vpc_config {
    security_group_ids = [aws_security_group.demo-cluster.id]
    subnet_ids         = aws_subnet.demo[*].id
  }

  depends_on = [
    aws_iam_role_policy_attachment.demo-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.demo-cluster-AmazonEKSVPCResourceController,
  ]
}

data "aws_eks_cluster" "example"{
  provider = aws
  name = var.cluster-name 
  depends_on = [
    aws_eks_cluster.demo,
    aws_eks_node_group.demo,
    aws_vpc.demo,
    aws_subnet.demo
  ]
}

data "aws_eks_cluster_auth" "example" {
  provider = aws
  name = var.cluster-name
  depends_on = [
    aws_eks_cluster.demo,
    aws_eks_node_group.demo,
    aws_vpc.demo,
    aws_subnet.demo
  ]
}


provider "kubectl" {
  host                   = data.aws_eks_cluster.example.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.example.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.example.token
  load_config_file       = false
}


data "kubectl_path_documents" "docs" {
    pattern = "./manifests/*.yaml"
}

resource "kubectl_manifest" "test" {
    wait = true
    count     = length(data.kubectl_path_documents.docs.documents)
    yaml_body = element(data.kubectl_path_documents.docs.documents, count.index)
     depends_on = [
        aws_eks_cluster.demo,
        aws_eks_node_group.demo,
        aws_vpc.demo,
        aws_subnet.demo
     ]
}