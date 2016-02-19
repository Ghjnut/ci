module SendgridWorkflow
  module Jenkins
    class Job
      id = nil
      name = ''
      git_repo = nil

      def start_branch_build(branch, artifact=false)
        JenkinsLib.start_job(options={BRANCH => branch})
      end
      def start_pr_build(pr_num, artifact=false)
        JenkinsLib.start_job(options={PR => pr_num})
      end
      def start_commit_build(hash, artifact=false)
        Jenkins::Build = JenkinsLib.start_job(options={HASH => hash})
      end
    end
    class Build
    end
    class Connection
    end
  end
end

