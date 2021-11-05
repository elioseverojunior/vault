data "aws_caller_identity" "current" {}

data "aws_iam_role" "pod_assume_role" {
  name = var.aws_role_name
}

data "aws_iam_role" "vault_cross_account_aws_role" {
  name = var.vault_aws_role_name != "" ? var.vault_aws_role_name : var.aws_role_name
}

data "aws_iam_policy_document" "vault_aws_iam_assume_role_policy" {
  depends_on = [data.aws_caller_identity.current]

  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
      ]
    }
  }

  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type = "Service"

      identifiers = [
        "ec2.amazonaws.com"
      ]
    }
  }
}

resource "aws_iam_role" "vault_aws_iam_assume_role" {
  assume_role_policy   = data.aws_iam_policy_document.vault_aws_iam_assume_role_policy.json
  description          = "${upper(local.role_name)} Vault Role"
  max_session_duration = var.aws_role_max_session_duration
  name                 = local.role_name
  tags                 = var.tags
}
