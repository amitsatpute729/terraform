resource "google_storage_bucket" "osi-bucket" {
  name     = "test-tf-${var.region}-${var.bucket_suffix}"
  location = "${var.region}"
}
