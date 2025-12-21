when defined(js):
  import "ntml"

  import "styles"

  import "components/slider/index"

  import "hooks/useTheme/index"

  import "global/theme/index"


  proc NavBar*(): Node =
    let theme = useTheme()
    let colorMode = signal(theme.get() == "dark")

    NavBarContainer:
      BrandButton(`type`="button", onClick = proc (e: Event) = navigate("/")):
        "JMS APPS"

      NavLinks:
        NavButton(`type`="button", onClick = proc (e: Event) = navigate("/")):
          "Home"

        NavButton(`type`="button", onClick = proc (e: Event) = navigate("/ntml")):
          "NTML Docs"

        NavToggleWrap:
          Slider(
            isToggled = colorMode,
            labelText = "Toggle color mode",
            leftSlot = block:
              span: "☀️",
            rightSlot = block:
              span: "🌙",
            onToggle = proc (next: bool) =
              if next:
                setStyledTheme(DarkTheme)
                theme.set("dark")
              else:
                setStyledTheme(LightTheme)
                theme.set("light")
          )
