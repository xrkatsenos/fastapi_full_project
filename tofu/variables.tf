variable "kube_config_path" {
  description = "Path to the kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}

variable "namespace" {
  description = "The namespace to deploy the application to"
  type        = string
  default     = "fastapi-test"
}
