//==================================================
//     Outputs that match the input variables
//==================================================
output "name_a" {
  description = "The value of the `name_a` input variable."
  value       = var.name_a
}
output "name_b" {
  description = "The value of the `name_b` input variable"
  value       = var.name_b
}
output "region_a" {
  description = "The value of the `region_a` input variable, or the Bucket A provider's region if the input was `null`."
  value       = local.region_a
}
output "region_b" {
  description = "The value of the `region_b` input variable, or the Bucket B provider's region if the input was `null`."
  value       = local.region_b
}
output "mfa_delete_enabled_a" {
  description = "The value of the `mfa_delete_enabled_a` input variable, or the default value if the input was `null`."
  value       = var.mfa_delete_enabled_a
}
output "mfa_delete_serial_number_a" {
  description = "The value of the `mfa_delete_serial_number_a` input variable, or the default value if the input was `null`."
  value       = var.mfa_delete_serial_number_a
}
output "mfa_delete_token_code_a" {
  description = "The value of the `mfa_delete_token_code_a` input variable, or the default value if the input was `null`."
  value       = var.mfa_delete_token_code_a
}
output "mfa_delete_enabled_b" {
  description = "The value of the `mfa_delete_enabled_b` input variable, or the default value if the input was `null`."
  value       = local.var_mfa_delete_enabled_b
}
output "mfa_delete_serial_number_b" {
  description = "The value of the `mfa_delete_serial_number_b` input variable, or the default value if the input was `null`."
  value       = local.var_mfa_delete_serial_number_b
}
output "mfa_delete_token_code_b" {
  description = "The value of the `mfa_delete_token_code_b` input variable, or the default value if the input was `null`."
  value       = local.var_mfa_delete_token_code_b
}
output "bucket_policy_json_documents_a" {
  description = "The value of the `bucket_policy_json_documents_a` input variable, or the default value if the input was `null`."
  value       = var.bucket_policy_json_documents_a
}
output "bucket_policy_json_documents_b" {
  description = "The value of the `bucket_policy_json_documents_b` input variable, or the default value if the input was `null`."
  value       = var.bucket_policy_json_documents_b
}
output "bucket_policy_json_documents_both" {
  description = "The value of the `bucket_policy_json_documents_both` input variable, or the default value if the input was `null`."
  value       = var.bucket_policy_json_documents_both
}
output "kms_key_arn_a" {
  description = "The value of the `kms_key_arn_a` input variable, or the default value if the input was `null`."
  value       = var.kms_key_arn_a
}
output "kms_key_arn_b" {
  description = "The value of the `kms_key_arn_b` input variable, or the default value if the input was `null`."
  value       = var.kms_key_arn_b
}
output "create_new_kms_key_a" {
  description = "The value of the `create_new_kms_key_a` input variable, or the default value if the input was `null`."
  value       = var.create_new_kms_key_a
}
output "create_new_kms_key_b" {
  description = "The value of the `create_new_kms_key_b` input variable, or the default value if the input was `null`."
  value       = var.create_new_kms_key_b
}
output "create_replica_kms_key_a" {
  description = "The value of the `create_replica_kms_key_a` input variable, or the default value if the input was `null`."
  value       = var.create_replica_kms_key_a
}
output "create_replica_kms_key_b" {
  description = "The value of the `create_replica_kms_key_b` input variable, or the default value if the input was `null`."
  value       = var.create_replica_kms_key_b
}
output "kms_key_policy_json_documents_a" {
  description = "The value of the `kms_key_policy_json_documents_a` input variable, or the default value if the input was `null`."
  value       = var.kms_key_policy_json_documents_a
}
output "kms_key_policy_json_documents_b" {
  description = "The value of the `kms_key_policy_json_documents_b` input variable, or the default value if the input was `null`."
  value       = var.kms_key_policy_json_documents_b
}
output "kms_key_policy_json_documents_both" {
  description = "The value of the `kms_key_policy_json_documents_both` input variable, or the default value if the input was `null`."
  value       = var.kms_key_policy_json_documents_both
}
output "enable_transfer_acceleration_a" {
  description = "The value of the `enable_transfer_acceleration_a` input variable, or the default value if the input was `null`."
  value       = var.enable_transfer_acceleration_a
}
output "enable_transfer_acceleration_b" {
  description = "The value of the `enable_transfer_acceleration_b` input variable, or the default value if the input was `null`."
  value       = local.var_enable_transfer_acceleration_b
}
output "block_public_acls_a" {
  description = "The value of the `block_public_acls_a` input variable, or the default value if the input was `null`."
  value       = var.block_public_acls_a
}
output "block_public_acls_b" {
  description = "The value of the `block_public_acls_b` input variable, or the default value if the input was `null`."
  value       = local.var_block_public_acls_b
}
output "block_public_policy_a" {
  description = "The value of the `block_public_policy_a` input variable, or the default value if the input was `null`."
  value       = var.block_public_policy_a
}
output "block_public_policy_b" {
  description = "The value of the `block_public_policy_b` input variable, or the default value if the input was `null`."
  value       = local.var_block_public_policy_b
}
output "ignore_public_acls_a" {
  description = "The value of the `ignore_public_acls_a` input variable, or the default value if the input was `null`."
  value       = var.ignore_public_acls_a
}
output "ignore_public_acls_b" {
  description = "The value of the `ignore_public_acls_b` input variable, or the default value if the input was `null`."
  value       = local.var_ignore_public_acls_b
}
output "restrict_public_buckets_a" {
  description = "The value of the `restrict_public_buckets_a` input variable, or the default value if the input was `null`."
  value       = var.restrict_public_buckets_a
}
output "restrict_public_buckets_b" {
  description = "The value of the `restrict_public_buckets_b` input variable, or the default value if the input was `null`."
  value       = local.var_restrict_public_buckets_b
}
output "object_ownership_a" {
  description = "The value of the `object_ownership_a` input variable, or the default value if the input was `null`."
  value       = var.object_ownership_a
}
output "object_ownership_b" {
  description = "The value of the `object_ownership_b` input variable, or the default value if the input was `null`."
  value       = local.var_object_ownership_b
}
output "append_region_suffix_a" {
  description = "The value of the `append_region_suffix_a` input variable, or the default value if the input was `null`."
  value       = var.append_region_suffix_a
}
output "append_region_suffix_b" {
  description = "The value of the `append_region_suffix_b` input variable, or the default value if the input was `null`."
  value       = local.var_append_region_suffix_b
}
output "object_lock_enabled_a" {
  description = "The value of the `object_lock_enabled_a` input variable, or the default value if the input was `null`."
  value       = var.object_lock_enabled_a
}
output "object_lock_enabled_b" {
  description = "The value of the `object_lock_enabled_b` input variable, or the default value if the input was `null`."
  value       = local.var_object_lock_enabled_b
}
output "force_destroy_a" {
  description = "The value of the `force_destroy_a` input variable, or the default value if the input was `null`."
  value       = var.force_destroy_a
}
output "force_destroy_b" {
  description = "The value of the `force_destroy_b` input variable, or the default value if the input was `null`."
  value       = local.var_force_destroy_b
}
output "force_allow_cloudtrail_digest_a" {
  description = "The value of the `force_allow_cloudtrail_digest_a` input variable, or the default value if the input was `null`."
  value       = var.force_allow_cloudtrail_digest_a
}
output "force_allow_cloudtrail_digest_b" {
  description = "The value of the `force_allow_cloudtrail_digest_b` input variable, or the default value if the input was `null`."
  value       = local.var_force_allow_cloudtrail_digest_b
}
output "replicate_a_to_b" {
  description = "The value of the `replicate_a_to_b` input variable, or the default value if the input was `null`."
  value       = var.replicate_a_to_b
}
output "replicate_b_to_a" {
  description = "The value of the `replicate_b_to_a` input variable, or the default value if the input was `null`."
  value       = var.replicate_b_to_a
}
output "a_to_b_rules" {
  description = "The value of the `a_to_b_rules` input variable, or the default value if the input was `null`."
  value       = var.a_to_b_rules
}
output "b_to_a_rules" {
  description = "The value of the `b_to_a_rules` input variable, or the default value if the input was `null`."
  value       = var.b_to_a_rules
}
output "cors_rules_a" {
  description = "The value of the `cors_rules_a` input variable, or the default value if the input was `null`."
  value       = var.cors_rules_a
}
output "cors_rules_b" {
  description = "The value of the `cors_rules_b` input variable, or the default value if the input was `null`."
  value       = local.var_cors_rules_b
}
output "enable_shield_drt_access_a" {
  description = "The value of the `enable_shield_drt_access_a` input variable."
  value       = var.enable_shield_drt_access_a
}
output "enable_shield_drt_access_b" {
  description = "The value of the `enable_shield_drt_access_b` input variable, or the value of the `enable_shield_drt_access_a` input variable if the input was `null`."
  value       = local.var_enable_shield_drt_access_b
}
output "tags_s3_bucket_a" {
  description = "The value of the `tags_s3_bucket_a` input variable."
  value       = var.tags_s3_bucket_a
}
output "tags_s3_bucket_b" {
  description = "The value of the `tags_s3_bucket_b` input variable."
  value       = var.tags_s3_bucket_b
}
output "tags_iam_role_a_to_b" {
  description = "The value of the `tags_iam_role_a_to_b` input variable."
  value       = var.tags_iam_role_a_to_b
}
output "tags_iam_role_b_to_a" {
  description = "The value of the `tags_iam_role_b_to_a` input variable."
  value       = var.tags_iam_role_b_to_a
}

//==================================================
//       Outputs generated by this module
//==================================================
output "bucket_a" {
  description = "The Invicton-Labs/secure-s3-bucket/aws module that was created for bucket A."
  value       = module.bucket_a
}
output "bucket_b" {
  description = "The Invicton-Labs/secure-s3-bucket/aws module that was created for bucket B."
  value       = module.bucket_b
}
output "replication" {
  description = "The Invicton-Labs/secure-s3-bucket-replication/aws module that was created for the bucket replication."
  value       = module.replication
}
output "complete" {
  depends_on = [
    module.replication.complete
  ]
  description = "Always `true`, but doesn't return until everything in this module has been applied."
  value       = true
}
