provider "aws" {
    region = "ap-south-1"
    profile = "default"
}

provider "google" {
    region = "us-central1"
    project = "project-ID"
    credentials  = "credentials.json"
}