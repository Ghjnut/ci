require 'minitest/autorun'
require 'workflow'
require 'octokit'

class TestWorkflow < Minitest::Test
  def setup
		config = Workflow::Configuration.factory
    @test_client = Workflow::Client.new @config
  end

  def test_jenkins_job_start
    skip
		job_name = 'test_job'
		# @test_client.jenkins_job_create(job_name)
		@test_client.jenkins_job_start(job_name)
		@test_client.jenkins_job_delete(job_name)
  end

  def test_github_pull_request_status
    skip 'Hits Github API'
    repo = 'Ghjnut/ci'
    pull_request_number = 1
    @test_client.github_pull_request_status(repo, pull_request_number)
  end

	def test_parse_semver_change
		skip 'Not Implemented'
	end

  def test_github_pull_request_merge
    skip 'Hits Github API'
    repo_name = 'Ghjnut/ci'
    pr_number = 1
    @test_client.github_pull_request_merge(repo, pr_number)
  end

  def test_github_pull_request_merge_failure
    skip 'Hits Github API'
    repo = 'Ghjnut/ci'
    pr_number = 0
    assert_raises Octokit::NotFound do
      @test_client.github_pull_request_merge(repo, pr_number)
    end
  end

 	def test_github_release_create
    skip
    repo_name = 'Ghjnut/ci'
    semver_tag = '0.0.0'
    @test_client.github_release_create(repo_name, semver_tag)
  end

 	def test_docker_compose_build
    skip
    service = 'test'
		file = 'docker-compose.test.yml'
    @test_client.docker_compose_build(service, file)
  end

  def test_docker_compose_tests
    skip
    service = 'workflow'
		command = 'rake test'
    @test_client.docker_compose_tests(service, command)
  end
end
