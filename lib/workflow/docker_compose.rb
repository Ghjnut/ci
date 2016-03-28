require 'backticks'

module Workflow
	class DockerCompose
		attr_accessor :service

		def initialize(service)
			@service = service
		end

		def build(service=nil, file='docker-compose.yml')
			command = "docker-compose -f #{file} build --force-rm #{service}"
			Backticks.run(command)
			return $?.success?
		end

		def run(command)
			command = "docker-compose run --rm #{@service} bash -c '#{command}'"
			Backticks.run(command)
			return $?.success?
		end
	end
end
