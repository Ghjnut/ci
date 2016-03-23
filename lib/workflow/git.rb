require 'oktokit'

module Workflow
  class Git
    def initialize(client)
      @client = client
    end

    def self.factory(_username, password)
      client = Octokit::Client.new(login: password, password: password)
      new(client)
    end
  end
  # module Git
  #   class Ref
  #     branch = nil
  #     commit = nil
  #     pr = nil
  #   end
  #   class Repo
  #     organization = ''
  #     name = ''
  #     url = ''
  #     ssh_ref = ''
  #     def merge_pr(Git::Ref)
  #     end
  #   end
  # end
end
