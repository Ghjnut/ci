require 'minitest/autorun'
require 'workflow'
require 'octokit'

class TestWorkflow < Minitest::Test
  def setup
    env = ENV
    workflow_path='./workflow.test.yml'
    config = Workflow::Configuration.factory(env, workflow_path)
    @test_client = Workflow::Client.new config
  end

  def test_jenkins_job_start
    skip 'Hits Github API'
    job_name = 'test_job'
    # @test_client.jenkins_job_create(job_name)
    @test_client.jenkins_job_start(job_name)
    # @test_client.jenkins_job_delete(job_name)
  end

  def test_github_pull_request_status
    skip 'Hits Github API'
    repo = 'Ghjnut/ci'
    pull_request_number = 1
    @test_client.github_pull_request_status(repo, pull_request_number)
  end

  def test_github_pull_request_status_failue
    skip 'Hits Github API'
    repo = 'Ghjnut/ci'
    pull_request_number = 0
    assert_raises Octokit::NotFound do
      @test_client.github_pull_request_status(repo, pull_request_number)
    end
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
    #skip 'Hits Github API'
    repo = 'Ghjnut/ci'
    semver_tag = '0.0.0'
    @test_client.github_release_create(repo, semver_tag)
  end

  def test_docker_compose_build
    skip 'Hits docker-compose api'
    file = 'docker-compose.test.yml'
    assert @test_client.docker_compose_build(file)
  end

  def test_docker_compose_test
    skip 'Hits docker-compose api'
    file = 'docker-compose.test.yml'
    shell = '/bin/sh'
    assert @test_client.docker_compose_test(file, shell)
  end

  def test_docker_compose_package
    skip 'Hits docker-compose api'
    file = 'docker-compose.test.yml'
    shell = '/bin/sh'
    assert @test_client.docker_compose_package(file, shell)
  end
end
