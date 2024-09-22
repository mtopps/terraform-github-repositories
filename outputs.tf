output "repository" {
  value = github_repository.repository
}

output "actions_variables" {
  value = github_actions_variable.action_variable
}

output "secrets" {
  value = github_actions_secret.repository_secret
}

output "html_url" {
  value = github_repository.repository.html_url
}

output "ssh_clone_url" {
  value = github_repository.repository.ssh_clone_url
}