terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.32.0"
    }
  }
}

provider "google" {
  credentials = file(var.creds_path)

  project = "dev-yuvalo"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_storage_bucket" "aviel_bucket" {
  name          = "aviel-test"
  location = "EU"
}

resource "google_container_registry" "registry" {
  location = "EU"
}

resource "google_artifact_registry_repository" "aviels-repo" {
  location      = "us-central1"
  repository_id = "aviels-repository"
  description   = "example docker repository"
  format        = "DOCKER"
}