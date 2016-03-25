require 'minitest/autorun'
require 'workflow'

class TestWorkflow < Minitest::Test
  def test_job_start
    # TODO: Start a jenkins job with a github PR.
    # Workflow.start_job('test')
    # assert_equal "OHAI!", @meme.i_can_has_cheezburger?
  end

  def test_create_release
    repo_name = 'Ghjnut/ci'
    semver_tag = '0.0.0'
    Workflow.github_create_release(repo_name, semver_tag)
  end

  def test_merge_pr_success
    # repo_name = 'Ghjnut/ci'
    # pr_number = 1
    # Workflow.merge_pr(repo, pr_number)
    # tags.each do |tag|
    #   puts tag.tag
    # end
  end

  def test_merge_pr_failure
    repo = 'Ghjnut/ci'
    pr_number = 0
    assert_raises Octokit::NotFound do
      Workflow.merge_pull_request(repo, pr_number)
    end
  end

  def test_job_pr_start
    # TODO: Start a jenkins job with a github PR.
    # Workflow.start_build('test')
    # assert_equal "OHAI!", @meme.i_can_has_cheezburger?
  end

  def test_job_pr_list
    # TODO: Test return of list of open prs.
    # Workflow.start_build('test')
    # assert_equal "OHAI!", @meme.i_can_has_cheezburger?
  end

  def test_build_create
    # TODO: Create a jenkins build.
  end

  def test_build_update
    # TODO: Update a jenkins build with expected return.
  end
end
