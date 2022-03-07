variable "teamid" {
  description = "Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
}

variable "description" {
  type        = string
  description = "Describe the codebuild"
  default     = null
}

variable "name" {
  description = "Name of the codebuild"
  default     = null
  type        = string
}

variable "branch_name" {
  description = "Branch name"
  default     = "main"
  type        = string
}

variable "repo_name" {
  description = "Branch name"
  type        = string
}

variable "owner_name" {
  description = "Branch name"
  type        = string
}
variable "deploy_cloud_build" {
  description = "Feature flag"
  default     = true
  type        = bool
}

variable "cloud_build_file" {
  description = "Cloudbuild file path relative to root of the repository"
  default     = "cloudbuild-sample.yml"
  type        = string
}

variable "substitutions" {
  description = "Substitutions"
  default     = {}
  type        = map(any)
}
