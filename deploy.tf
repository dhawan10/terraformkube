resource "kubernetes_deployment" "flask" {
  metadata {
    name = "flask"
    labels = {
      App = "flaskapp"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "flaskapp"
      }
    }
    template {
      metadata {
        labels = {
          App = "flaskapp"
        }
      }
      spec {
        container {
          image = "flask-restful-apis:v1.0.0"
          name  = "servicecontainer"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}