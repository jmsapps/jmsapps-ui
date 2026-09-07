when defined(js):
  import "ntml"

  import "global/theme/index"

  const themeKey = "jmsapps-theme"

  proc jsLocalStorageGet(key: cstring): cstring {.importjs: "(window.localStorage.getItem(#) || '')".}
  proc jsLocalStorageSet(key, value: cstring) {.importjs: "window.localStorage.setItem(#,#)".}

  proc isDark*(theme: StyledTheme): bool =
    not theme.isNil and theme.name == DarkTheme.name

  proc storedTheme(): StyledTheme =
    let stored = $jsLocalStorageGet(themeKey)
    if stored == DarkTheme.name or stored == "dark": DarkTheme else: LightTheme

  proc useTheme*() =
    setStyledTheme(storedTheme())

    discard styledThemeSignal().sub(proc (active: StyledTheme) =
      if not active.isNil:
        jsLocalStorageSet(themeKey, cstring(active.name)))
