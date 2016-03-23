require 'minitest/autorun'
require 'workflow'

class TestWorkflow < Minitest::Test
  def test_job_start
    # TODO: Start a jenkins job with a github PR.
    Workflow.start_job('test')
    # assert_equal "OHAI!", @meme.i_can_has_cheezburger?
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

  def test_build_update
    # TODO: Update a jenkins build with expected return.
  end

  # def setup
  #  @meme = Meme.new
  # end

  # def test_that_kitty_can_eat
  #  assert_equal "OHAI!", @meme.i_can_has_cheezburger?
  # end

  # def test_that_it_will_not_blend
  #  refute_match /^no/i, @meme.will_it_blend?
  # end

  # def test_that_will_be_skipped
  #  skip "test this later"
  # end
end
