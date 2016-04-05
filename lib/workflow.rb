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

    # Jenkins
    def jenkins_build_check(build_number)
      Workflow::Jenkins.build_info(build_number)
      # if GIT_URL != xxx.git
    end

    # Github
    def github_pull_request_status(repo, pull_request_number)
      # Add checks here
      github_client = Workflow::Github.factory(@config.github_token)

      pull_request = github_client.get_pull_request(repo, pull_request_number)

      merged = pull_request.merged
      mergeable = pull_request.mergeable
      # comments (code-review)?
      state = pull_request.state # sucess=good_build, open
      semver_change = parse_semver_change(pull_request.title)
      output = {
        merged: merged,
        mergeable: mergeable,
        state: state,
        semver_change: semver_change
      }
			#puts output
			return output
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
      github_client = Workflow::Github.factory(@config.github_token)
      unless github_client.pull_request_merged?(repo, pull_request_number)
        github_client.merge_pull_request(repo, pull_request_number)
      end
    end

    # Github
    def github_release_create(repo, tag_name, semver_tag)
      # check_pr_status(repo, 
      github_client = Workflow::Github.factory(@config.github_token)
      repo_tags = github_client.tag_get(repo)
      puts semver_tag
      puts repo_tags
      repo_tags.each do |tag|
        puts tag.name
        puts tag.commit.sha
        puts tag.zipball_url
      end
			# check tag not already release
      # create release
      # create tag
      # (link to generated package)
      #
    end

    # Virt:DC
    def docker_compose_build(dockerfile)
      dc = Workflow::DockerCompose.new(dockerfile, @config.workflow['project']['name'])
      dc.build
    end

    # Virt:DC
    def docker_compose_test(dockerfile, shell='/bin/bash')
      dc = Workflow::DockerCompose.new(dockerfile, @config.workflow['project']['name'])
      dc.run(@config.workflow['docker_compose']['test'], shell)
    end

    # Virt:DC
    def docker_compose_package(dockerfile, shell='/bin/bash')
      dc = Workflow::DockerCompose.new(dockerfile, @config.workflow['project']['name'])
      dc.run(@config.workflow['docker_compose']['package'], shell)
    end
  end
end
