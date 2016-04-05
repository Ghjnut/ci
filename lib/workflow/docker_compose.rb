require 'backticks'

module Workflow
  class DockerCompose
    attr_accessor :service

    def initialize(file='docker-compose.yml', service)
      @file = file
      @service = service
    end

    def build
      command = "docker-compose -f #{@file} build --force-rm"
      output = Backticks.run(command)
      return [ $?.success?, output ]
    end

		# TODO: The arguments need to be cut into argument options
    def run(command, shell)
      # '-c' may not handle all shells, but handles /bin/bash and /bin/sh
      command = "docker-compose -f #{@file} run --rm -T #{@service} #{shell} -c '#{command}'"
      output = Backticks.run(command)
      return [ $?.success?, output ]
    end
  end
end
