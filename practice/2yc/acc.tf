  resource "yandex_iam_service_account" "admin" {
    name        = "admin"
  }

  resource "yandex_iam_service_account" "instances-editor" {
    name        = "instances"
  }

  resource "yandex_iam_service_account" "docker-registry" {
    name        = "docker"
  }

  resource "yandex_resourcemanager_folder_iam_binding" "editor" {
    folder_id = var.ya_folder_id
    role = "editor"
    members = [
    "serviceAccount:${yandex_iam_service_account.instances-editor.id}",
  ]
  }

  resource "yandex_resourcemanager_folder_iam_binding" "pusher" {
    folder_id = var.ya_folder_id
    role = "container-registry.images.pusher"
    members = [
    "serviceAccount:${yandex_iam_service_account.docker-registry.id}",
  ]
  }

  resource "yandex_resourcemanager_folder_iam_binding" "puller" {
    folder_id = var.ya_folder_id
    role = "container-registry.images.puller"
    members = [
    "serviceAccount:${yandex_iam_service_account.docker-registry.id}",
  ]
  }

  resource "yandex_resourcemanager_folder_iam_binding" "admin" {
    folder_id = var.ya_folder_id
    role = "admin"
    members = [
    "serviceAccount:${yandex_iam_service_account.admin.id}",
  ]
  }
