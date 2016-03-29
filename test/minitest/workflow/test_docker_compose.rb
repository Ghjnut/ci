require 'minitest/autorun'
require 'workflow/docker_compose'

class TestDockerCompose < Minitest::Test
  def test_initialize_success
    skip 'Hits docker-compose'
    service = 'workflow'
    dc = Workflow::DockerCompose.new(service)
  end
end
