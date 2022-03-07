output "codebuild_trigger_id" {
  description = "Google codebuild trigger id"
  value       = join("", google_cloudbuild_trigger.default.*.id)
}

output "codebuild_project" {
  description = "Google codebuild project"
  value       = join("", google_cloudbuild_trigger.default.*.project)
}
