# CI
_WIP_

This gem serves as somewhat of a catch-all currently. Calls to Jenkins, Github,
and virtualization layers (docker, docker-compose, vagrant, chef) are wrapped up
as config-driven binaries. These are intended to make building, testing, and
packaging consistent as well as adding some sugar in the form of being able to
create pull requests, start jenkins builds, versioning etc.

Eventually the functionality this provides should be vetted and separated into
more logical components.

Example workflow.yml (intended to be committed to repo)
```
project:
  name: workflow
docker_compose:
  test: bin/test
  build: bin/build
  package: bin/package
vagrant:
  test: bin/test
  build: bin/build
  package: bin/package
...
```

Example ENV params (these will change based on stage of workflow)
```
export JENKINS_HOST=jenkins
export GITHUB_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
export VERSION=0.0.1
export RAILS_ENV=deployment
```

# Workflow
```
workflow
  jenkins
    job
      start
  github
    pull_request
      status
      merge
    release
      create

  docker-compose
    build
    test
    package
```

# Virt-specific
```
docker
  pull
  build
  run

docker-compose
  pull
  buil
  run

vagrant
  up
  ssh --command ''
```

# Packaging
- gem
- docker image
    - dev (sets up all dev tools) <package_name>_dev
    - prod (e.g. installs gem) <package_name>_release
- rpm (fpm)
- python
