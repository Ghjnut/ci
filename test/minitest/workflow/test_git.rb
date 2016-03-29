require 'minitest/autorun'
require 'workflow/git'

# Should only require octokit exceptions
require 'octokit'

class TestGithub < Minitest::Test
  def setup
    @config = Workflow::Configuration.factory
    @git_client = Workflow::Github.factory(@config.github_token)
  end

  def test_that_login_works
    skip 'TODO'
  end

  def test_load_branch
    skip 'Hits Github API'
    @git_client.load_branch('Ghjnut/ci', 'master')
  end

  def test_get_pull_request_success
    skip 'Hits Github API'
    @git_client.get_pull_request('Ghjnut/ci', 1)
  end

  def test_merge_pull_request_failure
    skip 'Hits Github API'
    assert_raises Octokit::NotFound do
      @git_client.merge_pull_request('Ghjnut/ci', 0)
    end
  end
end
