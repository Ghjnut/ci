require 'octokit'

module Workflow
  class Github
    def initialize(client)
      @client = client
    end

    def self.factory(access_token)
      client = Octokit::Client.new(access_token: access_token)
      new(client)
    end

    def load_branch(repo, branch)
      @client.get_branch(repo, branch)
    end

    # {
    #   "name": "v0.1",
    #   "commit": {
    #     "sha": "c5b97d5ae6c19d5c5df71a34c7fbeeda2479ccbc",
    #     "url": "https://api.github.com/repos/octocat/Hello-World/commits/c5b97
    #   },
    #   "zipball_url": "https://github.com/octocat/Hello-World/zipball/v0.1",
    #   "tarball_url": "https://github.com/octocat/Hello-World/tarball/v0.1"
    # }
    def get_repo_tags(repo)
      @client.tags(repo)
    end

    def get_pull_request(repo, pull_request_number)
      @client.pull_request(repo, pull_request_number)
    end

    def pull_request_merged?(repo, pull_request_number)
      @client.pull_request_merged?(repo, pull_request_number)
    end

    def merge_pull_request(repo, pull_request_number)
      @client.merge_pull_request(repo, pull_request_number)
    end
  end
end
