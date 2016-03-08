require 'jenkins_api_client'

module Workflow
  module Jenkins
    class Job
      id = nil
      name = ''
      git_repo = nil

      def start_branch_build(branch, artifact=false)
        #JenkinsLib.start_job(options={BRANCH => branch})
      end
      def start_pr_build(pr_num, artifact=false)
        #JenkinsLib.start_job(options={PR => pr_num})
      end
      def start_commit_build(hash, artifact=false)
        #Jenkins::Build = JenkinsLib.start_job(options={HASH => hash})
      end
    end
    class Build
    end
    class Connection
    end
		def Jenkins.build_create(build_name, xml)
			client = JenkinsApi::Client.new(:server_ip => 'jenkins')
			client.job.create(build_name, xml)
		end
		def Jenkins.build_update(build_name, xml)
			client = JenkinsApi::Client.new(:server_ip => 'jenkins')
			client.job.update(build_name, xml)
		end
		def Jenkins.job_start(job_name)
			client = JenkinsApi::Client.new(:server_ip => 'jenkins')
			client.job.build(job_name)
		end
  end
end

