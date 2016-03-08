require 'workflow/version'
require 'workflow/jenkins'

module Workflow
  #def start_build(jenkins_job, branch=nil, commit=nil, pull_request=nil, merge_master=False)
  def Workflow.start_job(job_name)
		Workflow::Jenkins.start_job(job_name)
    #build = JenkinsBuild = Jenkins.get_build(build_name)
    #return build.start(jenkins_job, branch=nil, commit=nil, pull_request=nil, merge_master=False)
  end

end
