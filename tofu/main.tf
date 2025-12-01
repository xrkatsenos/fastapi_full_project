resource "kubernetes_namespace" "fastapi_ns" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "fastapi_app" {
  name       = "my-fastapi"
  repository = "" # Local chart
  chart      = "../helm/fastapi"
  namespace  = kubernetes_namespace.fastapi_ns.metadata[0].name

  # Ensure namespace is created before helm release
  depends_on = [kubernetes_namespace.fastapi_ns]
}
