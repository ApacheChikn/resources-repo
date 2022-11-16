terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.40.0"
    }
  }
}

provider "google" {
  project = "confident-baton-362223"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_firewall" "default" {
  name    = "feltmate-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000", "22"]
  }

  source_tags = ["web"]
}

resource "google_compute_network" "default" {
  name = "test-network"
}

resource "google_service_account" "default" {
  account_id   = "confident-baton-362223"
  display_name = "Service Account"
}

resource "google_compute_instance" "super-natural" {
  name         = var.vm-name
  machine_type = var.machine-type
  zone         = var.zone

  tags = ["http-server", "https-server"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}

resource "google_storage_bucket" "apachechikn" {
  name          = var.bucket-name1
  location      = "US"
  force_destroy = true

}

resource "google_storage_bucket" "kamikazechikn" {
  name          = var.bucket-name2
  location      = "US"
  force_destroy = true

}

resource "google_storage_bucket" "super-natural_devops_engineer" {
  name          = var.bucket-name3
  location      = "US"
  force_destroy = true

}

resource "google_storage_bucket" "project-state-bucket-102" {
  name          = var.bucket-name4
  location      = "US"
  force_destroy = true

}
