variable "teamid" {
  description = "Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
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
  type    = bool
}

variable "cloud_build_file" {
  description = "Cloudbuild file path relative to root of the repository"
  default     = "cloudbuild-sample.yml"
}

variable "substitutions" {
  default = {}
}
