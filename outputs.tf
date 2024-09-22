output "repository" {
  description = "All attributes of the created repository"
  value       = github_repository.repository
}

output "full_name" {
  description = "A string of the form 'orgname/reponame'"
  value       = github_repository.repository.full_name
}

output "html_url" {
  description = "URL to the repository on the web"
  value       = github_repository.repository.html_url
}

output "ssh_clone_url" {
  description = "URL that can be provided to git clone to clone the repository via SSH"
  value       = github_repository.repository.ssh_clone_url
}

output "http_clone_url" {
  description = "URL that can be provided to git clone to clone the repository via HTTPS"
  value       = github_repository.repository.http_clone_url
}

output "git_clone_url" {
  description = "URL that can be provided to git clone to clone the repository anonymously via the git protocol"
  value       = github_repository.repository.git_clone_url
}

output "svn_url" {
  description = "URL that can be provided to svn checkout to check out the repository via GitHub's Subversion protocol emulation"
  value       = github_repository.repository.svn_url
}

output "node_id" {
  description = "GraphQL global node id for use with v4 API"
  value       = github_repository.repository.node_id
}

output "repo_id" {
  description = "GitHub ID for the repository"
  value       = github_repository.repository.repo_id
}

output "primary_language" {
  description = "The primary language used in the repository"
  value       = github_repository.repository.primary_language
}

output "pages" {
  description = "The repository's GitHub Pages configuration"
  value       = github_repository.repository.pages
}

output "security_and_analysis" {
  description = "The repository's security and analysis configuration"
  value       = github_repository.repository.security_and_analysis
}

output "topics" {
  description = "The list of topics of the repository"
  value       = github_repository.repository.topics
}

output "visibility" {
  description = "The visibility of the repository"
  value       = github_repository.repository.visibility
}

output "actions_secrets" {
  description = "List of actions secrets for the repository"
  value       = keys(github_actions_secret.repository_secret)
  sensitive   = true
}

output "actions_variables" {
  description = "List of actions variables for the repository"
  value       = keys(github_actions_variable.action_variable)
}

output "secrets" {
  value = github_actions_secret.repository_secret
}