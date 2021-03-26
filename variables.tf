variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
}

variable "gcp_project" {
  description = "gcp project to use"
}

variable "credentials" {
  default = "~/.gcloud/credentials.json"
}

variable "gcp_region" {
  default = "us-central1"
}

variable "description" {
  type        = any
  description = "Describe the codebuild"
  default     = null
}

variable "name" {
  default = null
}

variable "branch_name" {
  default = "main"
}

variable "repo_name" {}

variable "owner_name" {}

variable "build_timeout" {
  default = "120s"
}

variable "build_disabled" {
  default     = "false"
  description = "Whether the trigger is disabled or not. If true, the trigger will never result in a build."
}

variable "deploy_cloud_build" {
  default = true
}