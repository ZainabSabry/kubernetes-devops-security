resource "kubernetes_pod" "jenkins" {
  metadata {
    name = "jenkins"
    namespace = "default"
    labels = {
      "app" = "jenkins"
    }
  }
  

  spec {
    security_context {
      run_as_user = "0"
      run_as_group = "0"
    }
    container {
      image = "jenkins/jenkins:lts-jdk11"
      name  = "jenkins"

      volume_mount {
        mount_path = "/var/jenkins_home/"
        name = "jenkins-data"
      }

      port {
        container_port = 8080
      }
    }
  restart_policy = "OnFailure"
    volume {
      name = "jenkins-data"
      persistent_volume_claim {
        claim_name = kubernetes_persistent_volume_claim.jenkins_pvc.metadata.0.name
      }
    }
}
}