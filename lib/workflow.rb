require 'workflow/version'
require 'workflow/jenkins'

module Workflow
  def self.start_job(job_name)
    Workflow::Jenkins.start_job(job_name)
  end
end
