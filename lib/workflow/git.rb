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

    def branch_get(repo, branch)
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
    def tag_list(repo)
      @client.tags(repo)
    end

    def tag_create(repo, tag, message, object_sha)
      @client.tags(repo, tag, message, object_sha)
    end

    def release_list(repo)
      @client.list_releases(repo)
    end

    def release_create(repo, tag_name)
      @client.create_release(repo)
    end

    def release_delete(repo, release)
      @client.delete_release(repo)
    end

    def pull_request_get(repo, pull_request_number)
      @client.pull_request(repo, pull_request_number)
    end

    def pull_request_merge(repo, pull_request_number)
      @client.merge_pull_request(repo, pull_request_number)
    end

    def pull_request_merged?(repo, pull_request_number)
      @client.pull_request_merged?(repo, pull_request_number)
    end
  end
end
