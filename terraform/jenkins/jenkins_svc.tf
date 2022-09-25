resource "kubernetes_service" "jenkins" {
  metadata {
    name = "jenkins"
    namespace = "default"
  }
  spec {
    selector = {
      app = kubernetes_pod.jenkins.metadata.0.labels.app
    }

    port {
      name = "8080"
      port        = 8080
      target_port = 8080
    }

    port {
      name = "5000"
      port = 5000
      target_port = 5000
    }

    type = "NodePort"
  }
}


# resource "kubernetes_service" "jenkins-agents" {
#   metadata {
#     name = "jenkins-agents"
#     namespace = "default"
#   }
#   spec {
#     selector = {
#       app = kubernetes_pod.jenkins.metadata.0.labels.app
#     }

#     port {
#       port        = 5000
#       target_port = 5000
#     }

#     type = "ClusterIP"
#   }
# }