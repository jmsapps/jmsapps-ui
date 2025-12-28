
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

      Route(path="/ntml", component=NtmlDocsOverview):
        Route(path="/ntml/overview", component=NtmlDocsOverview)
        Route(path="/ntml/getting-started", component=NtmlDocsGettingStarted)
        Route(path="/ntml/elements", component=NtmlDocsElements)
        Route(path="/ntml/signals", component=NtmlDocsSignals)
        Route(path="/ntml/effects", component=NtmlDocsEffects)
        Route(path="/ntml/control-flow", component=NtmlDocsControlFlow)
        Route(path="/ntml/routing", component=NtmlDocsRouting)
        Route(path="/ntml/styling", component=NtmlDocsStyling)
        Route(path="/ntml/forms", component=NtmlDocsForms)

      Route(path="*", component=NotFound)

  try:
    render(App())
  except Exception as e:
    echo e.repr
