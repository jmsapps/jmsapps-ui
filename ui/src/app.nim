
when defined(js):
  import "ntml"

  import "containers/home/index"
  import "containers/ntml/index"

  import "components/notFound/index"

  import "global/theme/index"
  import "hooks/useTheme/index"


  proc App(): Node =
    let router: Router = router()
    let location: Signal[string] = router.location
    let theme = useTheme()

    setStyledTheme(if theme.get() == "dark": DarkTheme else: LightTheme)

    Routes(location):
      Route(path="/", component=Home)
      Route(path="/ntml", component=NtmlDocs)
      Route(path="*", component=NotFound)

  try:
    render(App())
  except Exception as e:
    echo e.repr
