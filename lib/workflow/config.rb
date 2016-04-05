require 'yaml'

module Workflow
  class Configuration
    attr_accessor :github_token
    attr_accessor :workflow

    def initialize(env, path)
      load_env_config(env)
      @workflow = load_workflow_yaml(path)
    end

    def load_env_config(env)
      @github_token = env['GITHUB_TOKEN']
    end

    def load_workflow_yaml(path)
      YAML.load(File.read(path))
    end

    def Configuration.factory(env=ENV, workflow_path='./workflow.yml')
      new(env, workflow_path)
    end
  end
end
