resource "google_folder_iam_audit_config" "folder_iam_audit_configs" {
  for_each = var.folder_iam_audit_configs

  folder  = each.value.folder
  service = each.value.service

  dynamic "audit_log_config" {
    for_each = each.value.audit_log_config
    content {
      exempted_members = audit_log_config.value.exempted_members
      log_type         = audit_log_config.value.log_type
    }
  }
}

