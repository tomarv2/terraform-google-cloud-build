module "cloud_build" {
  source = "../../"

  owner_name  = "tomarv2"
  repo_name   = "terraform-google-cloud-build"
  gcp_project = "demo-1000"
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}