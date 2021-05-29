## to launch VM instance in Development that is in Google cloud ENV

resource "google_compute_instance" "web-server-Development" {
  name         = "webserver"
  machine_type = "n1-standard-2"
  zone         = "us-central1-f"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }
  count = var.is_it_Production_ENV ? 0 : 1
}