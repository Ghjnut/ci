require 'minitest/autorun'
require 'workflow/git'
require 'octokit'

class TestWorkflowGithub < Minitest::Test
  def setup
    @config = Workflow::Configuration.new(ENV)
    @git_client = Workflow::Github.factory(@config.github_token)
  end

  def test_that_login_works
  end

  def test_load_branch
    @git_client.load_branch('Ghjnut/ci', 'master')
  end

  def test_get_pull_request_success
    @git_client.get_pull_request('Ghjnut/ci', 1)
  end

  def test_merge_pull_request_failure
    assert_raises Octokit::NotFound do
      @git_client.merge_pull_request('Ghjnut/ci', 0)
    end
  end

  def test_that_it_will_not_blend
    # refute_match /^no/i, @meme.will_it_blend?
  end

  def test_that_will_be_skipped
    skip 'test this later'
  end
end
