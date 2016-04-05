require 'minitest/autorun'
require 'workflow/git'

# Should only require octokit exceptions
require 'octokit'

class TestGithub < Minitest::Test
  def setup
    @config = Workflow::Configuration.factory
    @client = Workflow::Github.factory(@config.github_token)
  end

  def test_that_login_works
    skip 'TODO'
  end

  def test_load_branch
    skip 'Hits Github API'
    @client.branch_get('Ghjnut/ci', 'master')
  end

  def test_get_pull_request_success
    skip 'Hits Github API'
    @client.pull_request_get('Ghjnut/ci', 1)
  end

  def test_merge_pull_request_failure
    skip 'Hits Github API'
    assert_raises Octokit::NotFound do
      @client.pull_request_merge('Ghjnut/ci', 0)
    end
  end
end
