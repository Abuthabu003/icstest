terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.32.0" # Specify a version suitable for your Terraform version
    }
  }
}

provider "google" {
  project = "ICSTEST"
  region  = "us-central1" # Or your desired region
  zone    = "us-central1-f" # Or your des ired zone
}

resource "google_compute_instance" "vm_instance" {
  name         = "my-terraform-vm"
  machine_type = "e2-medium" # Choose your desired machine type
  zone         = "us-central1-f"

  boot_disk {
    initialize_params {
      image = "Debian GNU/Linux 12" # Choose your desired OS image
    }
  }

  network_interface {
    network = "default"
    access_config {
      # Optional: Enable public IP access

    }
  } 
}
