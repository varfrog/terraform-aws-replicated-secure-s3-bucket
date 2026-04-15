module "bucket_a" {
  source  = "Invicton-Labs/secure-s3-bucket/aws"
  version = "~>0.3.5"
  providers = {
    aws = aws.a
  }
  depends_on = [
    module.assert_same_account
  ]
  // Versioning always required for replication
  region                        = local.region_a
  versioned                     = true
  name                          = var.name_a
  mfa_delete_enabled            = var.mfa_delete_enabled_a
  mfa_delete_serial_number      = var.mfa_delete_serial_number_a
  mfa_delete_token_code         = var.mfa_delete_token_code_a
  bucket_policy_json_documents  = concat(var.bucket_policy_json_documents_a, var.bucket_policy_json_documents_both)
  kms_key_arn                   = var.kms_key_arn_a
  create_new_kms_key            = var.create_new_kms_key_a
  create_replica_kms_key        = var.create_replica_kms_key_a
  kms_key_policy_json_documents = concat(var.kms_key_policy_json_documents_a, var.kms_key_policy_json_documents_both)
  enable_transfer_acceleration  = var.enable_transfer_acceleration_a
  block_public_acls             = var.block_public_acls_a
  block_public_policy           = var.block_public_policy_a
  ignore_public_acls            = var.ignore_public_acls_a
  restrict_public_buckets       = var.restrict_public_buckets_a
  object_ownership              = var.object_ownership_a
  append_region_suffix          = var.append_region_suffix_a
  object_lock_enabled           = var.object_lock_enabled_a
  force_destroy                 = var.force_destroy_a
  force_allow_cloudtrail_digest = var.force_allow_cloudtrail_digest_a
  blocked_encryption_types      = var.blocked_encryption_types_a
  cors_rules                    = var.cors_rules_a
  enable_shield_drt_access      = var.enable_shield_drt_access_a
  tags_s3_bucket                = var.tags_s3_bucket_a
}

locals {
  // If a specific key was provided for bucket B, use that.
  // Otherwise, use the key that was used for bucket A as the base key
  b_kms_key_arn = var.kms_key_arn_b != null ? var.kms_key_arn_b : module.bucket_a.kms_key_arn
  // If a specific key was provided for bucket B, or we're supposed to create a new key for bucket B,
  // use the input `create_replica_kms_key_b` variable as-is. 
  b_create_replica_key = var.kms_key_arn_b != null || var.create_new_kms_key_b ? var.create_replica_kms_key_b : (
    // Otherwise, check if a key was used for Bucket A (one provided, or new one created)
    var.kms_key_arn_a != null || var.create_new_kms_key_a ? (
      // If a key was used for bucket A, only create a replica for bucket B if B is in a different region
      local.region_a != local.region_b
      ) : (
      // No key was used for bucket A, so we don't need a replica key for bucket B
      false
    )
  )
}

module "bucket_b" {
  source  = "Invicton-Labs/secure-s3-bucket/aws"
  version = "~>0.3.5"
  providers = {
    aws = aws.b
  }
  depends_on = [
    module.assert_same_account
  ]
  // Versioning always required for replication
  region                        = local.region_b
  versioned                     = true
  name                          = var.name_b
  mfa_delete_enabled            = local.var_mfa_delete_enabled_b
  mfa_delete_serial_number      = local.var_mfa_delete_serial_number_b
  mfa_delete_token_code         = local.var_mfa_delete_token_code_b
  bucket_policy_json_documents  = concat(var.bucket_policy_json_documents_b, var.bucket_policy_json_documents_both)
  kms_key_arn                   = local.b_kms_key_arn
  create_new_kms_key            = var.create_new_kms_key_b
  create_replica_kms_key        = local.b_create_replica_key
  kms_key_policy_json_documents = concat(var.kms_key_policy_json_documents_b, var.kms_key_policy_json_documents_both)
  enable_transfer_acceleration  = local.var_enable_transfer_acceleration_b
  block_public_acls             = local.var_block_public_acls_b
  block_public_policy           = local.var_block_public_policy_b
  ignore_public_acls            = local.var_ignore_public_acls_b
  restrict_public_buckets       = local.var_restrict_public_buckets_b
  object_ownership              = local.var_object_ownership_b
  append_region_suffix          = local.var_append_region_suffix_b
  object_lock_enabled           = local.var_object_lock_enabled_b
  force_destroy                 = local.var_force_destroy_b
  force_allow_cloudtrail_digest = local.var_force_allow_cloudtrail_digest_b
  blocked_encryption_types      = local.var_blocked_encryption_types_b
  cors_rules                    = local.var_cors_rules_b
  enable_shield_drt_access      = local.var_enable_shield_drt_access_b
  tags_s3_bucket                = var.tags_s3_bucket_b
}

module "replication" {
  source  = "Invicton-Labs/secure-s3-bucket-replication/aws"
  version = "~>0.2.3"
  providers = {
    aws.a = aws.a
    aws.b = aws.b
  }
  depends_on = [
    module.bucket_a.complete,
    module.bucket_b.complete,
  ]
  bucket_a_module      = module.bucket_a
  bucket_b_module      = module.bucket_b
  replicate_a_to_b     = var.replicate_a_to_b
  replicate_b_to_a     = var.replicate_b_to_a
  a_to_b_rules         = var.a_to_b_rules
  b_to_a_rules         = var.b_to_a_rules
  tags_iam_role_a_to_b = var.tags_iam_role_a_to_b
  tags_iam_role_b_to_a = var.tags_iam_role_b_to_a
}
