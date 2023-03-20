terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
    }
    helm = {
      source  = "hashicorp/helm"
    }
  }
}

provider "kubernetes" {
  # Adicione aqui as configurações do seu provedor Kubernetes
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config" # Atualize o caminho do arquivo de configuração do Kubernetes, se necessário
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "3.26.12" # Verifique a versão atual do ArgoCD no momento da implantação

  values = [
    file("values.yaml")
  ]
}
