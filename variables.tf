variable "name" {
  description = "The name of the repository"
  type        = string
}

variable "description" {
  description = "A description of the repository"
  type        = string
  default     = null
}

variable "homepage_url" {
  description = "URL of a page describing the project"
  type        = string
  default     = null
}

variable "visibility" {
  description = "Can be 'public' or 'private'"
  type        = string
  default     = null
  validation {
    condition     = var.visibility == null ? true : contains(["public", "private"], var.visibility)
    error_message = "Visibility must be either 'public' or 'private'."
  }
}

variable "has_issues" {
  description = "Set to true to enable the GitHub Issues features on the repository"
  type        = bool
  default     = null
}

variable "has_projects" {
  description = "Set to true to enable the GitHub Projects features on the repository"
  type        = bool
  default     = null
}

variable "has_wiki" {
  description = "Set to true to enable the GitHub Wiki features on the repository"
  type        = bool
  default     = null
}

variable "is_template" {
  description = "Set to true to tell GitHub that this is a template repository"
  type        = bool
  default     = null
}

variable "allow_merge_commit" {
  description = "Set to false to disable merge commits on the repository"
  type        = bool
  default     = null
}

variable "allow_squash_merge" {
  description = "Set to false to disable squash merges on the repository"
  type        = bool
  default     = null
}

variable "allow_rebase_merge" {
  description = "Set to false to disable rebase merges on the repository"
  type        = bool
  default     = null
}

variable "allow_auto_merge" {
  description = "Set to true to allow auto-merging pull requests on the repository"
  type        = bool
  default     = null
}

variable "squash_merge_commit_title" {
  description = "Can be 'PR_TITLE' or 'COMMIT_OR_PR_TITLE'"
  type        = string
  default     = null
  validation {
    condition     = var.squash_merge_commit_title == null ? true : contains(["PR_TITLE", "COMMIT_OR_PR_TITLE"], var.squash_merge_commit_title)
    error_message = "Squash merge commit title must be either 'PR_TITLE' or 'COMMIT_OR_PR_TITLE'."
  }
}

variable "squash_merge_commit_message" {
  description = "Can be 'PR_BODY', 'COMMIT_MESSAGES', or 'BLANK'"
  type        = string
  default     = null
  validation {
    condition     = var.squash_merge_commit_message == null ? true : contains(["PR_BODY", "COMMIT_MESSAGES", "BLANK"], var.squash_merge_commit_message)
    error_message = "Squash merge commit message must be 'PR_BODY', 'COMMIT_MESSAGES', or 'BLANK'."
  }
}

variable "merge_commit_title" {
  description = "Can be 'PR_TITLE' or 'MERGE_MESSAGE'"
  type        = string
  default     = null
  validation {
    condition     = var.merge_commit_title == null ? true : contains(["PR_TITLE", "MERGE_MESSAGE"], var.merge_commit_title)
    error_message = "Merge commit title must be either 'PR_TITLE' or 'MERGE_MESSAGE'."
  }
}

variable "merge_commit_message" {
  description = "Can be 'PR_BODY', 'PR_TITLE', or 'BLANK'"
  type        = string
  default     = null
  validation {
    condition     = var.merge_commit_message == null ? true : contains(["PR_BODY", "PR_TITLE", "BLANK"], var.merge_commit_message)
    error_message = "Merge commit message must be 'PR_BODY', 'PR_TITLE', or 'BLANK'."
  }
}

variable "delete_branch_on_merge" {
  description = "Automatically delete head branch after a pull request is merged"
  type        = bool
  default     = null
}

variable "auto_init" {
  description = "Set to true to produce an initial commit in the repository"
  type        = bool
  default     = null
}

variable "gitignore_template" {
  description = "Use the name of the template without the extension"
  type        = string
  default     = null
}

variable "license_template" {
  description = "Use the name of the template without the extension"
  type        = string
  default     = null
}

variable "archived" {
  description = "Specifies if the repository should be archived"
  type        = bool
  default     = null
}

variable "archive_on_destroy" {
  description = "Set to true to archive the repository instead of deleting on destroy"
  type        = bool
  default     = null
}

variable "topics" {
  description = "The list of topics of the repository"
  type        = list(string)
  default     = []
}

variable "template" {
  description = "Template repository to use"
  type = object({
    owner      = string
    repository = string
  })
  default = null
}

variable "vulnerability_alerts" {
  description = "Set to true to enable security alerts for vulnerable dependencies"
  type        = bool
  default     = null
}

variable "ignore_vulnerability_alerts_during_read" {
  description = "Set to true to not show vulnerability alerts during read"
  type        = bool
  default     = null
}

variable "pages" {
  description = "GitHub Pages configuration"
  type = object({
    source = object({
      branch = string
      path   = optional(string)
    })
    build_type = optional(string)
    cname      = optional(string)
  })
  default = null
}

variable "security_and_analysis" {
  description = "Security and analysis settings for the repository"
  type = object({
    advanced_security = optional(object({
      status = string
    }))
    secret_scanning = optional(object({
      status = string
    }))
    secret_scanning_push_protection = optional(object({
      status = string
    }))
  })
  default = null
}

variable "plaintext_secrets" {
  description = "(Optional) Configuring plaintext actions secrets."
  type        = map(string)
  default     = {}
}

variable "encrypted_secrets" {
  description = "(Optional) Configuring encryptyed actions secrets."
  type        = map(string)
  default     = {}
}

variable "actions_variables" {
  description = "(Optional) Configuring actions variables."
  type        = map(string)
  default     = {}
}

variable "has_downloads" {
  description = "Set to true to enable the (deprecated) downloads features on the repository"
  type        = bool
  default     = null
}
