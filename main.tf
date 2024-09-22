resource "github_repository" "repository" {
  name                                    = var.name
  description                             = var.description
  visibility                              = var.visibility != null ? var.visibility : "private"
  has_issues                              = var.has_issues
  has_projects                            = var.has_projects
  has_wiki                                = var.has_wiki
  is_template                             = var.is_template
  allow_merge_commit                      = var.allow_merge_commit
  allow_squash_merge                      = var.allow_squash_merge
  allow_rebase_merge                      = var.allow_rebase_merge
  allow_auto_merge                        = var.allow_auto_merge
  delete_branch_on_merge                  = var.delete_branch_on_merge
  auto_init                               = var.auto_init
  archive_on_destroy                      = var.archive_on_destroy
  archived                                = var.archived
  topics                                  = length(var.topics) > 0 ? var.topics : null
  vulnerability_alerts                    = var.vulnerability_alerts
  ignore_vulnerability_alerts_during_read = var.ignore_vulnerability_alerts_during_read


  homepage_url                = var.homepage_url != null ? var.homepage_url : null
  squash_merge_commit_title   = var.squash_merge_commit_title != null ? var.squash_merge_commit_title : null
  squash_merge_commit_message = var.squash_merge_commit_message != null ? var.squash_merge_commit_message : null
  merge_commit_title          = var.merge_commit_title != null ? var.merge_commit_title : null
  merge_commit_message        = var.merge_commit_message != null ? var.merge_commit_message : null
  gitignore_template          = var.gitignore_template != null ? var.gitignore_template : null
  license_template            = var.license_template != null ? var.license_template : null

  dynamic "template" {
    for_each = var.template != null ? [var.template] : []
    content {
      owner      = template.value.owner
      repository = template.value.repository
    }
  }

  dynamic "pages" {
    for_each = var.pages != null ? [var.pages] : []
    content {
      source {
        branch = pages.value.source.branch
        path   = pages.value.source.path
      }
      build_type = pages.value.build_type
      cname      = pages.value.cname
    }
  }

  dynamic "security_and_analysis" {
    for_each = var.security_and_analysis != null ? [var.security_and_analysis] : []
    content {
      dynamic "advanced_security" {
        for_each = security_and_analysis.value.advanced_security != null ? [security_and_analysis.value.advanced_security] : []
        content {
          status = advanced_security.value.status
        }
      }
      dynamic "secret_scanning" {
        for_each = security_and_analysis.value.secret_scanning != null ? [security_and_analysis.value.secret_scanning] : []
        content {
          status = secret_scanning.value.status
        }
      }
      dynamic "secret_scanning_push_protection" {
        for_each = security_and_analysis.value.secret_scanning_push_protection != null ? [security_and_analysis.value.secret_scanning_push_protection] : []
        content {
          status = secret_scanning_push_protection.value.status
        }
      }
    }
  }
}

# Configuration for GitHub Actions secrets and variables
# Manages both plaintext and encrypted secrets
# Creates Actions variables from provided map
# Enables flexible management of Actions configuration

locals {
  plaintext_secrets = {
    for name, value in coalesce(var.plaintext_secrets, {}) : name => { plaintext = value }
  }
  encrypted_secrets = {
    for name, value in coalesce(var.encrypted_secrets, {}) : name => { encrypted = value }
  }

  secrets = merge(local.plaintext_secrets, local.encrypted_secrets)
}

data "github_actions_public_key" "this" {
  repository = github_repository.repository.name
  depends_on = [
    github_repository.repository
  ]
}

resource "github_actions_secret" "repository_secret" {
  for_each        = local.secrets
  repository      = github_repository.repository.name
  secret_name     = each.key
  plaintext_value = try(each.value.plaintext, null)
  encrypted_value = try(each.value.encrypted, null)
  depends_on = [
    github_repository.repository
  ]
}

resource "github_actions_variable" "action_variable" {
  for_each      = coalesce(var.actions_variables, {})
  repository    = github_repository.repository.name
  variable_name = each.key
  value         = each.value
  depends_on = [
    github_repository.repository
  ]
}
