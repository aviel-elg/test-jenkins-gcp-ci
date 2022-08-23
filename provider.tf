provider "google" {
  credentials = file(var.creds_path)
  project = "dev-yuvalo"
  region  = "us-central1"
  zone    = "us-central1-c"
}