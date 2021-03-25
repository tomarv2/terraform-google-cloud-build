resource "google_cloudbuild_trigger" "default" {

  name        = var.name != null ? var.name : "${var.teamid}-${var.prjid}"
  description = var.description == null ? "Terraform managed: ${var.teamid}-${var.prjid}" : var.description
  tags        = merge(local.shared_tags)
  disabled    = var.build_disabled

  trigger_template {
    branch_name = var.branch_name
    repo_name   = var.repo_name
  }

  build {
    step {
      name    = "gcr.io/cloud-builders/gsutil"
      args    = ["cp", "gs://mybucket/remotefile.zip", "localfile.zip"]
      timeout = var.build_timeout
    }

    source {
      storage_source {
        bucket = "mybucket"
        object = "source_code.tar.gz"
      }
    }
    tags = ["build", "newFeature"]
    substitutions = {
      _FOO = "bar"
      _BAZ = "qux"
    }
    queue_ttl   = "20s"
    logs_bucket = "gs://mybucket/logs"
    secret {
      kms_key_name = "projects/myProject/locations/global/keyRings/keyring-name/cryptoKeys/key-name"
      secret_env = {
        PASSWORD = "ZW5jcnlwdGVkLXBhc3N3b3JkCg=="
      }
    }
    artifacts {
      images = ["gcr.io/$PROJECT_ID/$REPO_NAME:$COMMIT_SHA"]
      objects {
        location = "gs://bucket/path/to/somewhere/"
        paths    = ["path"]
      }
    }
    options {
      source_provenance_hash  = ["MD5"]
      requested_verify_option = "VERIFIED"
      machine_type            = "N1_HIGHCPU_8"
      disk_size_gb            = 100
      substitution_option     = "ALLOW_LOOSE"
      dynamic_substitutions   = true
      log_streaming_option    = "STREAM_OFF"
      worker_pool             = "pool"
      logging                 = "LEGACY"
      env                     = ["ekey = evalue"]
      secret_env              = ["secretenv = svalue"]
      volumes {
        name = "v1"
        path = "v1"
      }
    }
  }
}