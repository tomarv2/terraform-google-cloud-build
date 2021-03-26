output "codebuild_trigger_id" {
  description = "Google codebuild trigger id"
  value       = module.cloud_build.codebuild_trigger_id
}

output "codebuild_project" {
  description = "Google codebuild project"
  value       = module.cloud_build.codebuild_project
}