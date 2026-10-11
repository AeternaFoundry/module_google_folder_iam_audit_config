variable "folder_iam_audit_configs" {
  description = <<EOT
Map of folder_iam_audit_configs, attributes below
Required:
    - folder
    - service
    - audit_log_config (block):
        - exempted_members (optional)
        - log_type (required)
EOT

  type = map(object({
    folder  = string
    service = string
    audit_log_config = list(object({
      exempted_members = optional(set(string))
      log_type         = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.folder_iam_audit_configs : (
        length(v.audit_log_config) >= 1
      )
    ])
    error_message = "Each audit_log_config list must contain at least 1 items"
  }
}

