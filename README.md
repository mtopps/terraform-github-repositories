# terraform-github-repositories
Terraform module to provision github repositories(WIP)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
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
| <a name="input_squash_merge_commit_message"></a> [squash\_merge\_commit\_message](#input\_squash\_merge\_commit\_message) | Can be 'PR\_BODY', 'COMMIT\_MESSAGES', or 'BLANK' | `string` | `null` | no |
| <a name="input_squash_merge_commit_title"></a> [squash\_merge\_commit\_title](#input\_squash\_merge\_commit\_title) | Can be 'PR\_TITLE' or 'COMMIT\_OR\_PR\_TITLE' | `string` | `null` | no |
| <a name="input_template"></a> [template](#input\_template) | Template repository to use | <pre>object({<br>    owner      = string<br>    repository = string<br>  })</pre> | `null` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | The list of topics of the repository | `list(string)` | `[]` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | Can be 'public' or 'private' | `string` | `null` | no |
| <a name="input_vulnerability_alerts"></a> [vulnerability\_alerts](#input\_vulnerability\_alerts) | Set to true to enable security alerts for vulnerable dependencies | `bool` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_actions_variables"></a> [actions\_variables](#output\_actions\_variables) | n/a |
| <a name="output_html_url"></a> [html\_url](#output\_html\_url) | n/a |
| <a name="output_repository"></a> [repository](#output\_repository) | n/a |
| <a name="output_secrets"></a> [secrets](#output\_secrets) | n/a |
| <a name="output_ssh_clone_url"></a> [ssh\_clone\_url](#output\_ssh\_clone\_url) | n/a |
<!-- END_TF_DOCS -->