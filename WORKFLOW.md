# Workflow
High level
```
pr_submitted
  has_version? (#minor, #major, #patch)
    job_build
    generate_package

requst build
  which branch/commit/pr?
  is pr
    merge after?
  build artifact?
  publish to staging?
```

Calls
```
start_build(branch, commit, pr)
is_pr()
merge_pr()
build_artifact()
publish_artifact()
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

### Pull Request
1. merge master
1a. pre-build
2. build
3. test
4. generate artifact

### Workflow
workflow
  build
  test
  generate artifact

  docker
    build
    test
    generate artifact

  docker-compose
    build
    test
    generate artifact

  vagrant build
    jk

