resource "google_cloudbuild_trigger" "default" {
  count = var.deploy_cloud_build ? 1 : 0

  name        = var.name != null ? var.name : "${var.teamid}-${var.prjid}"
  description = var.description == null ? "Terraform managed: ${var.teamid}-${var.prjid}" : var.description

  // NOTE: `trigger_template` or `github` is required

  //  trigger_template {
  //    branch_name = var.branch_name
  //    repo_name   = var.repo_name
  //    invert_regex = false -> null
  //    project_id   = "demo-1000" -> null
  //  }

  github {
    owner = var.owner_name
    name  = var.repo_name
    push {
      branch       = var.branch_name
      invert_regex = false
    }
  }

  substitutions = var.substitutions
  //  substitutions = {
  //    _FOO = "hello"
  //    _BAR = "world"
  //  }

  filename = var.cloud_build_file
}
