variable "creds_path" {
  type        = string
  description = "Path to credentials file"
}

variable "project" {
  type        = string
  default     = "dev-yuvalo"
  description = "The GCP project to be deployed to"
}

variable "region" {
  default = "us-central1"
  type    = string
}

variable "environment" {
  default     = "dev"
  description = "The environment name"
}

variable "location" {
  default = "us-central1"
  type    = string
}