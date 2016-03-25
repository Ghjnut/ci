module Workflow
  class Configuration
    attr_accessor :github_token
    def initialize(env)
      @github_token = env['GITHUB_TOKEN']
    end
  end
end
