resource "google_cloudbuild_trigger" "default" {
  count = var.deploy_cloud_build ? 1 : 0

  name        = var.name != null ? var.name : "${var.teamid}-${var.prjid}"
  description = var.description == null ? "Terraform managed: ${var.teamid}-${var.prjid}" : var.description
  project     = var.gcp_project

  //  trigger_template {
  //    branch_name = var.branch_name
  //    repo_name   = var.repo_name
  //    invert_regex = false -> null
  //    project_id   = "security-269000" -> null
  //  }

  github {
    owner = var.owner_name
    name  = var.repo_name
    push {
      branch       = var.branch_name
      invert_regex = false
    }
  }

  substitutions = {
    _FOO = "bar"
    _BAZ = "qux"
  }

  filename = "cloudbuild.yml"
}