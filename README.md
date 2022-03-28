<p align="center">
    <a href="https://github.com/tomarv2/terraform-google-cloud-build/actions/workflows/pre-commit.yml" alt="Pre Commit">
        <img src="https://github.com/tomarv2/terraform-google-cloud-build/actions/workflows/pre-commit.yml/badge.svg?branch=main" /></a>
    <a href="https://www.apache.org/licenses/LICENSE-2.0" alt="license">
        <img src="https://img.shields.io/github/license/tomarv2/terraform-google-cloud-build" /></a>
    <a href="https://github.com/tomarv2/terraform-google-cloud-build/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-google-cloud-build" /></a>
    <a href="https://github.com/tomarv2/terraform-google-cloud-build/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/tomarv2/terraform-google-cloud-build" /></a>
    <a href="https://stackoverflow.com/users/6679867/tomarv2" alt="Stack Exchange reputation">
        <img src="https://img.shields.io/stackexchange/stackoverflow/r/6679867"></a>
    <a href="https://twitter.com/intent/follow?screen_name=varuntomar2019" alt="follow on Twitter">
        <img src="https://img.shields.io/twitter/follow/varuntomar2019?style=social&logo=twitter"></a>
</p>

## Terraform module for Google Cloud Build

> :arrow_right:  Terraform module for [AWS CodeBuild](https://registry.terraform.io/modules/tomarv2/codebuild/aws/latest)

> :arrow_right:  Terraform module for [AWS CodePipeline](https://registry.terraform.io/modules/tomarv2/codepipeline/aws/latest)

### Versions

- Module tested for Terraform 1.0.1.
- Google provider version [4.12.0](https://registry.terraform.io/providers/hashicorp/google/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use <a href="https://github.com/tomarv2/terraform-google-cloud-build/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-google-cloud-build" /></a> in your releases)

### Usage

#### Option 1:

```
terrafrom init
terraform plan -var='teamid=tryme' -var='prjid=project1'
terraform apply -var='teamid=tryme' -var='prjid=project1'
terraform destroy -var='teamid=tryme' -var='prjid=project1'
```
**Note:** With this option please take care of remote state storage

#### Option 2:

##### Recommended method (stores remote state in S3 using `prjid` and `teamid` to create directory structure):

- Create python 3.8+ virtual environment
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote --upgrade
```

- Set below environment variables:
```
export TF_GCLOUD_BUCKET=<remote state bucket name>
export TF_GCLOUD_PREFIX=<remote state bucket prefix>
export TF_GCLOUD_CREDENTIALS=<gcp credentials.json>
```

- Updated `examples` directory with required values.

- Run and verify the output before deploying:
```
tf -c=gcloud plan -var='teamid=foo' -var='prjid=bar'
```

- Run below to deploy:
```
tf -c=gcloud apply -var='teamid=foo' -var='prjid=bar'
```

- Run below to destroy:
```
tf -c=gcloud destroy -var='teamid=foo' -var='prjid=bar'
```

**Note:** Read more on [tfremote](https://github.com/tomarv2/tfremote)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.1 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.12.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 4.12.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloudbuild_trigger.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_branch_name"></a> [branch\_name](#input\_branch\_name) | Branch name | `string` | `"main"` | no |
| <a name="input_cloud_build_file"></a> [cloud\_build\_file](#input\_cloud\_build\_file) | Cloudbuild file path relative to root of the repository | `string` | `"cloudbuild-sample.yml"` | no |
| <a name="input_deploy_cloud_build"></a> [deploy\_cloud\_build](#input\_deploy\_cloud\_build) | Feature flag | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | Describe the codebuild | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the codebuild | `string` | `null` | no |
| <a name="input_owner_name"></a> [owner\_name](#input\_owner\_name) | Branch name | `string` | n/a | yes |
| <a name="input_prjid"></a> [prjid](#input\_prjid) | Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `string` | n/a | yes |
| <a name="input_repo_name"></a> [repo\_name](#input\_repo\_name) | Branch name | `string` | n/a | yes |
| <a name="input_substitutions"></a> [substitutions](#input\_substitutions) | Substitutions | `map(any)` | `{}` | no |
| <a name="input_teamid"></a> [teamid](#input\_teamid) | Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_codebuild_project"></a> [codebuild\_project](#output\_codebuild\_project) | Google codebuild project |
| <a name="output_codebuild_trigger_id"></a> [codebuild\_trigger\_id](#output\_codebuild\_trigger\_id) | Google codebuild trigger id |

Please refer to examples directory [link](examples) for references.

## Permissions required to get Cloud Build list

```
cloudbuild.builds.get
cloudbuild.builds.list
```

Depending on your requirement set the permissions.

:point_right: Get `Service account` used by Cloud Build:

```
CLOUDBUILD_SA="$(gcloud projects describe $PROJECT_ID --format 'value(projectNumber)')@cloudbuild.gserviceaccount.com"
```

:point_right: Assign `editor` permission to the project:

```
gcloud projects add-iam-policy-binding $PROJECT_ID --member serviceAccount:$CLOUDBUILD_SA --role roles/editor
```

## Enable below apis for Cloud Build

Following APIs must be enabled on the project:
- `compute.googleapis.com`
- `cloudbuild.googleapis.com`

## Troubleshooting

:point_right: Cloud Build uses a special service account: [PROJECT_NUMBER]@cloudbuild.gserviceaccount.com.

:point_right: [Cloud Build service account](https://cloud.google.com/build/docs/cloud-build-service-account)

:point_right: [Configuring access for Cloud Build Service Account](https://cloud.google.com/build/docs/securing-builds/configure-access-for-cloud-build-service-account)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.1 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.12.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 4.12.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloudbuild_trigger.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_branch_name"></a> [branch\_name](#input\_branch\_name) | Branch name | `string` | `"main"` | no |
| <a name="input_cloud_build_file"></a> [cloud\_build\_file](#input\_cloud\_build\_file) | Cloudbuild file path relative to root of the repository | `string` | `"cloudbuild-sample.yml"` | no |
| <a name="input_deploy_cloud_build"></a> [deploy\_cloud\_build](#input\_deploy\_cloud\_build) | Feature flag | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | Describe the codebuild | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the codebuild | `string` | `null` | no |
| <a name="input_owner_name"></a> [owner\_name](#input\_owner\_name) | Branch name | `string` | n/a | yes |
| <a name="input_prjid"></a> [prjid](#input\_prjid) | Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `string` | n/a | yes |
| <a name="input_repo_name"></a> [repo\_name](#input\_repo\_name) | Branch name | `string` | n/a | yes |
| <a name="input_substitutions"></a> [substitutions](#input\_substitutions) | Substitutions | `map(any)` | `{}` | no |
| <a name="input_teamid"></a> [teamid](#input\_teamid) | Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_codebuild_project"></a> [codebuild\_project](#output\_codebuild\_project) | Google codebuild project |
| <a name="output_codebuild_trigger_id"></a> [codebuild\_trigger\_id](#output\_codebuild\_trigger\_id) | Google codebuild trigger id |
<!-- END_TF_DOCS -->