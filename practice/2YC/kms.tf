resource "yandex_kms_symmetric_key" "key-a" {
  name              = "kuber-symmetric-key"
  description       = "description for key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h" // equal to 1 year
}

resource "yandex_iam_service_account_static_access_key" "static-access-key" {
  service_account_id = yandex_iam_service_account.instances-editor.id
  depends_on = [
    yandex_iam_service_account.instances-editor,
  ]
}
