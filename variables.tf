variable "name_a" {
  description = "The name to use for bucket A."
  type        = string
  nullable    = false
}

variable "name_b" {
  description = "The name to use for bucket B."
  type        = string
  nullable    = false
}

variable "region_a" {
  description = "The AWS region in which to create bucket A. If not provided, the provider region will be used."
  type        = string
  default     = null
  nullable    = true
}

variable "region_b" {
  description = "The AWS region in which to create bucket B. If not provided, the provider region will be used."
  type        = string
  default     = null
  nullable    = true
}

variable "mfa_delete_enabled_a" {
  description = "Whether MFA Delete should be enabled for the bucket A."
  type        = bool
  default     = false
  nullable    = false
}
variable "mfa_delete_serial_number_a" {
  description = "The serial number of the MFA device to use for MFA delete for bucket A."
  type        = string
  default     = null
  nullable    = true
}
variable "mfa_delete_token_code_a" {
  description = "The token code currently showing on the MFA device to use for MFA delete for bucket A."
  type        = string
  default     = null
  nullable    = true
}

variable "mfa_delete_enabled_b" {
  description = "Whether MFA Delete should be enabled for the bucket B. If not provided, will default to the value of `mfa_delete_enabled_a`."
  type        = bool
  default     = null
}
variable "mfa_delete_serial_number_b" {
  description = "The serial number of the MFA device to use for MFA delete for bucket B. If not provided, will default to the value of `mfa_delete_serial_number_a`."
  type        = string
  default     = null
  nullable    = true
}
variable "mfa_delete_token_code_b" {
  description = "The token code currently showing on the MFA device to use for MFA delete for bucket B. If not provided, will default to the value of `mfa_delete_token_code_a`."
  type        = string
  default     = null
  nullable    = true
}
locals {
  var_mfa_delete_enabled_b       = var.mfa_delete_enabled_b != null ? var.mfa_delete_enabled_b : var.mfa_delete_enabled_a
  var_mfa_delete_serial_number_b = var.mfa_delete_serial_number_b != null ? var.mfa_delete_serial_number_b : var.mfa_delete_serial_number_a
  var_mfa_delete_token_code_b    = var.mfa_delete_token_code_b != null ? var.mfa_delete_token_code_b : var.mfa_delete_token_code_a
}

variable "bucket_policy_json_documents_a" {
  description = "A list of JSON-encoded policy documents to apply to bucket A. The placeholder \"{BUCKET_ARN}\" can be used to reference the ARN of the bucket the policy is being applied to."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "bucket_policy_json_documents_b" {
  description = "A list of JSON-encoded policy documents to apply to bucket B. The placeholder \"{BUCKET_ARN}\" can be used to reference the ARN of the bucket the policy is being applied to."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "bucket_policy_json_documents_both" {
  description = "A list of JSON-encoded policy documents to apply to both buckets. The placeholder \"{BUCKET_ARN}\" can be used to reference the ARN of the bucket the policy is being applied to."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "kms_key_arn_a" {
  description = "The ARN of the KMS key to use for bucket A. If not provided, AES256 encryption will be enforced instead, unless `create_new_kms_key_a` is set to `true`."
  type        = string
  default     = null
}

variable "kms_key_arn_b" {
  description = "The ARN of the KMS key to use for bucket B. If not provided, AES256 encryption will be enforced instead, unless `create_new_kms_key_b` is set to `true`."
  type        = string
  default     = null
}

variable "create_new_kms_key_a" {
  description = "Whether to create a new KMS key for use with bucket A. If `kms_key_arn_a` is not provided (null), a new key will be created. If `kms_key_arn_a` is provided, a replica of that key will be created."
  type        = bool
  default     = false
  nullable    = false
}

variable "create_new_kms_key_b" {
  description = "Whether to create a new KMS key for use with bucket B. If `kms_key_arn_b` is not provided (null), a new key will be created. If `kms_key_arn_b` is provided, a replica of that key will be created."
  type        = bool
  default     = false
  nullable    = false
}

variable "create_replica_kms_key_a" {
  description = "Whether to create a replica of the `kms_key_arn_a` key for use with bucket A, if `kms_key_arn_a` was provided."
  type        = bool
  default     = false
  nullable    = false
}
variable "create_replica_kms_key_b" {
  description = "Whether to create a replica of the `kms_key_arn_b` key for use with bucket B, if `kms_key_arn_b` was provided."
  type        = bool
  default     = false
  nullable    = false
}

variable "kms_key_policy_json_documents_a" {
  description = "A list of JSON-encoded policy documents to apply to the KMS key created for bucket A, if one should be created."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "kms_key_policy_json_documents_b" {
  description = "A list of JSON-encoded policy documents to apply to the KMS key created for bucket B, if one should be created."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "kms_key_policy_json_documents_both" {
  description = "A list of JSON-encoded policy documents to apply to the KMS keys created for each bucket, if a KMS key was created."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "enable_transfer_acceleration_a" {
  description = "Whether to enable transfer acceleration for bucket A."
  type        = bool
  default     = false
  nullable    = false
}
variable "enable_transfer_acceleration_b" {
  description = "Whether to enable transfer acceleration for bucket B. If not provided, will default to the value of `enable_transfer_acceleration_a`."
  type        = bool
  default     = null
}
locals {
  var_enable_transfer_acceleration_b = var.enable_transfer_acceleration_b != null ? var.enable_transfer_acceleration_b : var.enable_transfer_acceleration_a
}

variable "block_public_acls_a" {
  description = "The `block_public_acls` value of an `aws_s3_bucket_public_access_block` resource that is applied to bucket A."
  type        = bool
  default     = true
  nullable    = false
}
variable "block_public_acls_b" {
  description = "The `block_public_acls` value of an `aws_s3_bucket_public_access_block` resource that is applied to bucket B. If not provided, will default to the value of `enable_transfer_acceleration_a`."
  type        = bool
  default     = null
}
locals {
  var_block_public_acls_b = var.block_public_acls_b != null ? var.block_public_acls_b : var.block_public_acls_a
}

variable "block_public_policy_a" {
  description = "The `block_public_policy` value of an `aws_s3_bucket_public_access_block` resource that is applied to bucket A."
  type        = bool
  default     = true
  nullable    = false
}
variable "block_public_policy_b" {
  description = "The `block_public_policy` value of an `aws_s3_bucket_public_access_block` resource that is applied to bucket B. If not provided, will default to the value of `block_public_policy_a`."
  type        = bool
  default     = null
}
locals {
  var_block_public_policy_b = var.block_public_policy_b != null ? var.block_public_policy_b : var.block_public_policy_a
}

variable "ignore_public_acls_a" {
  description = "The `ignore_public_acls` value of an `aws_s3_bucket_public_access_block` resource that is applied to bucket A."
  type        = bool
  default     = true
  nullable    = false
}
variable "ignore_public_acls_b" {
  description = "The `ignore_public_acls` value of an `aws_s3_bucket_public_access_block` resource that is applied to bucket B. If not provided, will default to the value of `block_public_policy_a`."
  type        = bool
  default     = null
}
locals {
  var_ignore_public_acls_b = var.ignore_public_acls_b != null ? var.ignore_public_acls_b : var.ignore_public_acls_a
}

variable "restrict_public_buckets_a" {
  description = "The `restrict_public_buckets` value of an `aws_s3_bucket_public_access_block` resource that is applied to bucket A."
  type        = bool
  default     = true
  nullable    = false
}
variable "restrict_public_buckets_b" {
  description = "The `restrict_public_buckets` value of an `aws_s3_bucket_public_access_block` resource that is applied to bucket B. If not provided, will default to the value of `restrict_public_buckets_a`."
  type        = bool
  default     = null
}
locals {
  var_restrict_public_buckets_b = var.restrict_public_buckets_b != null ? var.restrict_public_buckets_b : var.restrict_public_buckets_a
}

variable "object_ownership_a" {
  description = "The `rule.object_ownership` value of an `aws_s3_bucket_ownership_controls` resource that is applied to bucket A."
  type        = string
  default     = "BucketOwnerEnforced"
  nullable    = false
}
variable "object_ownership_b" {
  description = "The `rule.object_ownership` value of an `aws_s3_bucket_ownership_controls` resource that is applied to bucket B. If not provided, will default to the value of `object_ownership_a`."
  type        = string
  default     = null
}
locals {
  var_object_ownership_b = var.object_ownership_b != null ? var.object_ownership_b : var.object_ownership_a
}

variable "append_region_suffix_a" {
  description = "If `true`, a suffix in the form of `-{region_name}` will be appended to the name of bucket A. This is convenient if you're creating buckets in multiple regions and don't want to manually specify the region name in each one for uniqueness."
  type        = bool
  default     = false
  nullable    = false
}
variable "append_region_suffix_b" {
  description = "If `true`, a suffix in the form of `-{region_name}` will be appended to the name of bucket B. This is convenient if you're creating buckets in multiple regions and don't want to manually specify the region name in each one for uniqueness. If not provided, will default to the value of `append_region_suffix_a`."
  type        = bool
  default     = null
}
locals {
  var_append_region_suffix_b = var.append_region_suffix_b != null ? var.append_region_suffix_b : var.append_region_suffix_a
}

variable "object_lock_enabled_a" {
  description = "Whether to enable Object Lock for bucket A."
  type        = bool
  default     = false
  nullable    = false
}
variable "object_lock_enabled_b" {
  description = "Whether to enable Object Lock for bucket B. If not provided, will default to the value of `object_lock_enabled_a`."
  type        = bool
  default     = false
}
locals {
  var_object_lock_enabled_b = var.object_lock_enabled_b != null ? var.object_lock_enabled_b : var.object_lock_enabled_a
}

variable "force_destroy_a" {
  description = "Whether all objects (including any locked objects) should be deleted from bucket A so that the bucket can be destroyed without error."
  type        = bool
  default     = false
  nullable    = false
}
variable "force_destroy_b" {
  description = "Whether all objects (including any locked objects) should be deleted from bucket B so that the bucket can be destroyed without error. If not provided, will default to the value of `force_destroy_a`."
  type        = bool
  default     = null
}
locals {
  var_force_destroy_b = var.force_destroy_b != null ? var.force_destroy_b : var.force_destroy_a
}

variable "force_allow_cloudtrail_digest_a" {
  description = "Whether to allow AES256 (AWS-managed key) encryption for paths checked by CloudTrail digest writers for bucket A. Even when a bucket and a CloudTrail are both set to use KMS encryption, digests are still written using AWS-managed key AES256 encryption (). This variable only has an effect when the `kms_key_id` variable is provided and not `null`."
  type        = bool
  default     = false
  nullable    = false
}
variable "force_allow_cloudtrail_digest_b" {
  description = "Whether to allow AES256 (AWS-managed key) encryption for paths checked by CloudTrail digest writers for bucket B. Even when a bucket and a CloudTrail are both set to use KMS encryption, digests are still written using AWS-managed key AES256 encryption (). This variable only has an effect when the `kms_key_id` variable is provided and not `null`. If not provided, will default to the value of `force_allow_cloudtrail_digest_a`."
  type        = bool
  default     = null
}
locals {
  var_force_allow_cloudtrail_digest_b = var.force_allow_cloudtrail_digest_b != null ? var.force_allow_cloudtrail_digest_b : var.force_allow_cloudtrail_digest_a
}

variable "replicate_a_to_b" {
  description = "Whether to replicate objects from bucket A to bucket B."
  type        = bool
  nullable    = false
}

variable "replicate_b_to_a" {
  description = "Whether to replicate objects from bucket B to bucket A."
  type        = bool
  nullable    = false
}

variable "a_to_b_rules" {
  description = "A list of rules for replicating objects from bucket A to bucket B, ordered by descending priority. If none are provided, it will default to replicating everything, including delete markers and replica modifications."
  type = list(object({
    id                          = string
    delete_marker_replication   = bool
    existing_object_replication = bool
    replica_modifications       = bool
    prefix                      = string
    tags                        = map(string)
    replication_time            = number
    event_threshold             = number
    storage_class               = string
  }))
  default  = []
  nullable = false
}

variable "b_to_a_rules" {
  description = "A list of rules for replicating objects from bucket B to bucket A, ordered by descending priority. If none are provided, it will default to replicating everything, including delete markers and replica modifications."
  type = list(object({
    id                          = string
    delete_marker_replication   = bool
    existing_object_replication = bool
    replica_modifications       = bool
    prefix                      = string
    tags                        = map(string)
    replication_time            = number
    event_threshold             = number
    storage_class               = string
  }))
  default  = []
  nullable = false
}

variable "blocked_encryption_types_a" {
  description = "A list of encryption types to block for uploads to bucket A. Valid values are `NONE` (block unencrypted uploads) and `SSE-C` (block client-provided encryption key uploads). Defaults to `[\"NONE\"]` to match AWS's default behavior for new buckets."
  type        = list(string)
  default     = ["NONE"]
  nullable    = false
}
variable "blocked_encryption_types_b" {
  description = "A list of encryption types to block for uploads to bucket B. If not provided, will default to the value of `blocked_encryption_types_a`."
  type        = list(string)
  default     = null
}
locals {
  var_blocked_encryption_types_b = var.blocked_encryption_types_b != null ? var.blocked_encryption_types_b : var.blocked_encryption_types_a
}

variable "cors_rules_a" {
  description = "A list of CORS rules to apply to bucket A."
  type = list(object({
    allowed_headers = optional(list(string))
    allowed_methods = list(string)
    allowed_origins = list(string)
    expose_headers  = optional(list(string))
    id              = optional(string)
    max_age_seconds = optional(number)
  }))
  nullable = false
  default  = []
}

variable "cors_rules_b" {
  description = "A list of CORS rules to apply to bucket B. If not provided, will default to the value of `cors_rules_a`."
  type = list(object({
    allowed_headers = optional(list(string))
    allowed_methods = list(string)
    allowed_origins = list(string)
    expose_headers  = optional(list(string))
    id              = optional(string)
    max_age_seconds = optional(number)
  }))
  nullable = false
  default  = []
}
locals {
  var_cors_rules_b = var.cors_rules_b != null ? var.cors_rules_b : var.cors_rules_a
}

variable "enable_shield_drt_access_a" {
  description = "Whether to add a policy to bucket A for Shield Advanced DRT access. If the `aws_shield_drt_access_log_bucket_association` resource is used for this bucket, it will modify the bucket policy. This variable causes the same policy to be added, preventing them from conflicting."
  type        = bool
  default     = null
  nullable    = true
}

variable "enable_shield_drt_access_b" {
  description = "Whether to add a policy to bucket B for Shield Advanced DRT access. If the `aws_shield_drt_access_log_bucket_association` resource is used for this bucket, it will modify the bucket policy. This variable causes the same policy to be added, preventing them from conflicting. If not provided, will default to the value of `enable_shield_drt_access_a`."
  type        = bool
  default     = null
  nullable    = true
}
locals {
  var_enable_shield_drt_access_b = var.enable_shield_drt_access_b != null ? var.enable_shield_drt_access_b : var.enable_shield_drt_access_a
}

variable "tags_s3_bucket_a" {
  description = "A map of tags to apply to S3 bucket A."
  type        = map(string)
  nullable    = true
  default     = null
}

variable "tags_s3_bucket_b" {
  description = "A map of tags to apply to S3 bucket B."
  type        = map(string)
  nullable    = true
  default     = null
}

variable "tags_iam_role_a_to_b" {
  description = "A map of tags to apply to the IAM role used for A-to-B replication."
  type        = map(string)
  nullable    = true
  default     = null
}

variable "tags_iam_role_b_to_a" {
  description = "A map of tags to apply to the IAM role used for A-to-B replication."
  type        = map(string)
  nullable    = true
  default     = null
}
