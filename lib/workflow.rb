module Workflow
	#def start_build(jenkins_job, branch=nil, commit=nil, pull_request=nil, merge_master=False)
	def start_build(job_name)
		@client = JenkinsApi::Client.new(:server_ip => 'jenkins')
		@client.job.build(job_name)

		#build = JenkinsBuild = Jenkins.get_build(build_name)
		#return build.start(jenkins_job, branch=nil, commit=nil, pull_request=nil, merge_master=False)
	end

end
