require 'workflow/version'
require 'workflow/config'
require 'workflow/jenkins'
require 'workflow/git'
require 'workflow/docker_compose'

require 'semantic'
require 'logger'

module Workflow
  class Client
    def initialize(config)
      @config = config
    end

    # Jenkins
    def jenkins_job_start(job_name)
      Workflow::Jenkins.start_job(job_name)
    end

    # Github
    def github_pull_request_status(repo, pull_request_number)
      # Add checks here
      config = Workflow::Configuration.factory
      github_client = Workflow::Github.factory(config.github_token)
      pull_request = github_client.get_pull_request(repo, pull_request_number)
      merged = pull_request.merged
      mergeable = pull_request.mergeable
      state = pull_request.state
      semver_change = parse_semver_change(pull_request.title)
      output = "Merged? : #{merged} Mergeable? : #{mergeable} State: #{state} Semver_change: #{semver_change}"

      puts output

      # - merged?
      # - mergeable?
      # - comments (code-review)?
      # - build status? (configurable, open or success)
      # - change type (patch, minor, major)
    end

    def parse_semver_change(title)
      change = nil

      if title.include? '#patch'
        change = 'patch'
      elsif title.include? '#minor'
        change = 'minor'
      elsif title.include? '#major'
        change = 'major'
      end

      return change
    end

    # Github
    def github_pull_request_merge(repo, pull_request_number)
      config = Workflow::Configuration.factory
      github_client = Workflow::Github.factory(config.github_token)
      unless github_client.pull_request_merged?(repo, pull_request_number)
        github_client.merge_pull_request(repo, pull_request_number)
      end
    end

    # Github
    def github_release_create(repo, semver_tag)
      # check_pr_status(repo, 
      config = Workflow::Configuration.factory
      github_client = Workflow::Github.factory(config.github_token)
      repo_tags = github_client.get_repo_tags(repo)
      puts semver_tag
      puts repo_tags
      # repo_tags.each do |tag|
      #   puts tag.name
      #   puts tag.commit.sha
      #   puts tag.zipball_url
      # end
      # semver_tag = Workflow
      #   fail
      # assert conforms to SemVer
      # assert doesn't
      # create release
      # create tag
      # (link to generated package)
      #
    end

    # Virt:DC
    def docker_compose_build(service, dockerfile)
      # config = Workflow::Configuration.factory
      dc = Workflow::DockerCompose.new(service)
      dc.build(service, dockerfile)
    end

    # Virt:DC
    def docker_compose_tests(service, command)
      dc = Workflow::DockerCompose.new(service)
      # yml[:virtualization][:docker-compose][:test]
      dc.run(command)
    end
  end
end
