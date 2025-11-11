
when defined(js):
  import "ntml"

  import "containers/home/index"
  import "containers/ntmlDocs/index"

  import "components/notFound/index"


  proc App(): Node =
    let router: Router = router()
    let location: Signal[string] = router.location

    Routes(location):
      Route(path="/", component=Home)
      Route(path="/ntml", component=NtmlDocs)
      Route(path="*", component=NotFound)

  try:
    render(App())
  except Exception as e:
    echo e.repr
