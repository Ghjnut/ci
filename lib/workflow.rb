require 'workflow/version'
require 'workflow/config'
require 'workflow/jenkins'
require 'workflow/git'

module Workflow
  def self.start_job(job_name)
    Workflow::Jenkins.start_job(job_name)
  end

  def self.merge_pull_request(repo, pull_request_number)
    config = Workflow::Configuration.new(ENV)
    github_client = Workflow::Github.factory(config.github_token)
    unless github_client.pull_request_merged?(repo, pull_request_number)
      github_client.merge_pull_request(repo, pull_request_number)
    end
  end

  def self.github_create_release(repo_name, semver_tag)
    config = Workflow::Configuration.new(ENV)
    github_client = Workflow::Github.factory(config.github_token)
    repo_tags = github_client.get_repo_tags(repo_name)
    #repo_tags.each do |tag|
    #  puts tag.name
    #  puts tag.commit.sha
    #  puts tag.zipball_url
    #end
    # semver_tag = Workflow
    #   fail
    # assert conforms to SemVer
    # assert doesn't
    # create release
    # create tag
    # (link to generated package)
    #
  end
end
