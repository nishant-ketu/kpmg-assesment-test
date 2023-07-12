provider "google" {
}
terraform {
 backend "gcs" {
   bucket = "tf-bucket"
   prefix = "/dev"
 }
}
module "vpc" {
  source = "./modules/vpc"
}

module "web" {
  source     = "./modules/web"
  network    = module.vpc.network
  subnetwork = module.vpc.subnetwork
  zone               = "${module.project.region}-b"
  type               = var.vm_type
  image              = var.ubuntu22_image
  service_account    = module.iam.jump_service_account
  startup_script     = <<SCRIPT
sudo apt update -y ;
SCRIPT
}

module "database" {
  source     = "./modules/database"
  network    = module.vpc.network
  subnetwork = module.vpc.subnetwork
  region     = module.project.region
  size       = "10"
  availability  = var.db_availability
  tier       = var.db_tier
}
