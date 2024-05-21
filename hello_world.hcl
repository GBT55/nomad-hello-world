job "hello-world" {
  datacenters = ["lan"]
  type        = "service"

  group "app" {
    count = 2

    network {
      port "http" {
        static = 8008
        to     = 8008
      }
    }

    service {
      name = "webapp"
      tags = [
        "traefik.enable=true",
        #"traefik.http.routers.webapp.rule=Host(`bedbug-lb-tf-1464285659.eu-central-1.elb.amazonaws.com`)",
        #"traefik.http.middlewares.testheader.headers.customresponseheaders.X-Script-Name=test"
      ]
      port = "http"

      check {
        name     = "alive"
        type     = "http"
        path     = "/"
        interval = "10s"
        timeout  = "2s"
      }

      connect {
        sidecar_service {}
      }
    }


    restart {
      attempts = 2
      interval = "30m"
      delay    = "15s"
      mode     = "fail"
    }

    task "server" {
      driver         = "docker"
      shutdown_delay = "2s"

      config {
        image = "gbt55/nomad-hello-world"
        ports = ["http"]
      }

      env {
        MESSAGE = "Hello World from Nomad!"
      }
    }
  }
}