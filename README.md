# terraform-github-repositories

Terraform module to provision GitHub repositories with enhanced functionality for individual users.

## Overview

This Terraform module is designed primarily for individual GitHub users who are not part of a team or organization. It provides a streamlined way to create and manage GitHub repositories with additional features:

- Create public or private repositories with customizable settings
- Enable or disable GitHub features like Issues, Projects, and Wikis
- Set up GitHub Pages configuration
- Manage repository visibility and archiving
- Configure branch protection rules and merge settings
- Add topics to your repository for better discoverability
- Create GitHub Actions secrets and variables for CI/CD deployments

This module is particularly useful for developers who want to automate their GitHub repository setup and maintain consistency across multiple projects. It allows for easy management of repository settings and secrets, which is especially valuable for individual developers working on multiple projects or maintaining open-source contributions.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 6.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_actions_secret.repository_secret](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_variable.action_variable](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_variable) | resource |
| [github_repository.repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_actions_public_key.this](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/actions_public_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_actions_variables"></a> [actions\_variables](#input\_actions\_variables) | (Optional) Configuring actions variables. | `map(string)` | `{}` | no |
| <a name="input_allow_auto_merge"></a> [allow\_auto\_merge](#input\_allow\_auto\_merge) | Set to true to allow auto-merging pull requests on the repository | `bool` | `null` | no |
| <a name="input_allow_merge_commit"></a> [allow\_merge\_commit](#input\_allow\_merge\_commit) | Set to false to disable merge commits on the repository | `bool` | `null` | no |
| <a name="input_allow_rebase_merge"></a> [allow\_rebase\_merge](#input\_allow\_rebase\_merge) | Set to false to disable rebase merges on the repository | `bool` | `null` | no |
| <a name="input_allow_squash_merge"></a> [allow\_squash\_merge](#input\_allow\_squash\_merge) | Set to false to disable squash merges on the repository | `bool` | `null` | no |
| <a name="input_archive_on_destroy"></a> [archive\_on\_destroy](#input\_archive\_on\_destroy) | Set to true to archive the repository instead of deleting on destroy | `bool` | `null` | no |
| <a name="input_archived"></a> [archived](#input\_archived) | Specifies if the repository should be archived | `bool` | `null` | no |
| <a name="input_auto_init"></a> [auto\_init](#input\_auto\_init) | Set to true to produce an initial commit in the repository | `bool` | `null` | no |
| <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge) | Automatically delete head branch after a pull request is merged | `bool` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | A description of the repository | `string` | `null` | no |
| <a name="input_encrypted_secrets"></a> [encrypted\_secrets](#input\_encrypted\_secrets) | (Optional) Configuring encryptyed actions secrets. | `map(string)` | `{}` | no |
| <a name="input_gitignore_template"></a> [gitignore\_template](#input\_gitignore\_template) | Use the name of the template without the extension | `string` | `null` | no |
| <a name="input_has_downloads"></a> [has\_downloads](#input\_has\_downloads) | Set to true to enable the (deprecated) downloads features on the repository | `bool` | `null` | no |
| <a name="input_has_issues"></a> [has\_issues](#input\_has\_issues) | Set to true to enable the GitHub Issues features on the repository | `bool` | `null` | no |
| <a name="input_has_projects"></a> [has\_projects](#input\_has\_projects) | Set to true to enable the GitHub Projects features on the repository | `bool` | `null` | no |
| <a name="input_has_wiki"></a> [has\_wiki](#input\_has\_wiki) | Set to true to enable the GitHub Wiki features on the repository | `bool` | `null` | no |
| <a name="input_homepage_url"></a> [homepage\_url](#input\_homepage\_url) | URL of a page describing the project | `string` | `null` | no |
| <a name="input_ignore_vulnerability_alerts_during_read"></a> [ignore\_vulnerability\_alerts\_during\_read](#input\_ignore\_vulnerability\_alerts\_during\_read) | Set to true to not show vulnerability alerts during read | `bool` | `null` | no |
| <a name="input_is_template"></a> [is\_template](#input\_is\_template) | Set to true to tell GitHub that this is a template repository | `bool` | `null` | no |
| <a name="input_license_template"></a> [license\_template](#input\_license\_template) | Use the name of the template without the extension | `string` | `null` | no |
| <a name="input_merge_commit_message"></a> [merge\_commit\_message](#input\_merge\_commit\_message) | Can be 'PR\_BODY', 'PR\_TITLE', or 'BLANK' | `string` | `null` | no |
| <a name="input_merge_commit_title"></a> [merge\_commit\_title](#input\_merge\_commit\_title) | Can be 'PR\_TITLE' or 'MERGE\_MESSAGE' | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the repository | `string` | n/a | yes |
| <a name="input_pages"></a> [pages](#input\_pages) | GitHub Pages configuration | <pre>object({<br>    source = object({<br>      branch = string<br>      path   = optional(string)<br>    })<br>    build_type = optional(string)<br>    cname      = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_plaintext_secrets"></a> [plaintext\_secrets](#input\_plaintext\_secrets) | (Optional) Configuring plaintext actions secrets. | `map(string)` | `{}` | no |
| <a name="input_security_and_analysis"></a> [security\_and\_analysis](#input\_security\_and\_analysis) | Security and analysis settings for the repository | <pre>object({<br>    advanced_security = optional(object({<br>      status = string<br>    }))<br>    secret_scanning = optional(object({<br>      status = string<br>    }))<br>    secret_scanning_push_protection = optional(object({<br>      status = string<br>    }))<br>  })</pre> | `null` | no |
| <a name="input_squash_merge_commit_message"></a> [squash\_merge\_commit\_message](#input\_squash\_merge\_commit\_message) | Can be 'PR\_BODY', 'COMMIT\_MESSAGES', or 'BLANK' | `string` | `null` | no |
| <a name="input_squash_merge_commit_title"></a> [squash\_merge\_commit\_title](#input\_squash\_merge\_commit\_title) | Can be 'PR\_TITLE' or 'COMMIT\_OR\_PR\_TITLE' | `string` | `null` | no |
| <a name="input_template"></a> [template](#input\_template) | Template repository to use | <pre>object({<br>    owner      = string<br>    repository = string<br>  })</pre> | `null` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | The list of topics of the repository | `list(string)` | `[]` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | Can be 'public' or 'private' | `string` | `null` | no |
| <a name="input_vulnerability_alerts"></a> [vulnerability\_alerts](#input\_vulnerability\_alerts) | Set to true to enable security alerts for vulnerable dependencies | `bool` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_actions_secrets"></a> [actions\_secrets](#output\_actions\_secrets) | List of actions secrets for the repository |
| <a name="output_actions_variables"></a> [actions\_variables](#output\_actions\_variables) | List of actions variables for the repository |
| <a name="output_full_name"></a> [full\_name](#output\_full\_name) | A string of the form 'orgname/reponame' |
| <a name="output_git_clone_url"></a> [git\_clone\_url](#output\_git\_clone\_url) | URL that can be provided to git clone to clone the repository anonymously via the git protocol |
| <a name="output_html_url"></a> [html\_url](#output\_html\_url) | URL to the repository on the web |
| <a name="output_http_clone_url"></a> [http\_clone\_url](#output\_http\_clone\_url) | URL that can be provided to git clone to clone the repository via HTTPS |
| <a name="output_node_id"></a> [node\_id](#output\_node\_id) | GraphQL global node id for use with v4 API |
| <a name="output_pages"></a> [pages](#output\_pages) | The repository's GitHub Pages configuration |
| <a name="output_primary_language"></a> [primary\_language](#output\_primary\_language) | The primary language used in the repository |
| <a name="output_repo_id"></a> [repo\_id](#output\_repo\_id) | GitHub ID for the repository |
| <a name="output_repository"></a> [repository](#output\_repository) | All attributes of the created repository |
| <a name="output_secrets"></a> [secrets](#output\_secrets) | n/a |
| <a name="output_security_and_analysis"></a> [security\_and\_analysis](#output\_security\_and\_analysis) | The repository's security and analysis configuration |
| <a name="output_ssh_clone_url"></a> [ssh\_clone\_url](#output\_ssh\_clone\_url) | URL that can be provided to git clone to clone the repository via SSH |
| <a name="output_svn_url"></a> [svn\_url](#output\_svn\_url) | URL that can be provided to svn checkout to check out the repository via GitHub's Subversion protocol emulation |
| <a name="output_topics"></a> [topics](#output\_topics) | The list of topics of the repository |
| <a name="output_visibility"></a> [visibility](#output\_visibility) | The visibility of the repository |
<!-- END_TF_DOCS -->