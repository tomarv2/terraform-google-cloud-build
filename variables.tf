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