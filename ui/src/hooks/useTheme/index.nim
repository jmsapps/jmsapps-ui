when defined(js):
  import std/strutils

  type ThemeHandle* = object

  const themeKey* = "jmsapps-theme"

  proc jsLocalStorageGet(key: cstring): cstring {.importjs: "window.localStorage.getItem(#)".}
  proc jsLocalStorageSet(key, value: cstring) {.importjs: "window.localStorage.setItem(#,#)".}

  proc normalize(themeName: string): string =
    let lowered = themeName.toLowerAscii()
    case lowered
    of "dark": "dark"
    of "light": "light"
    else: "light"

  proc useTheme*(): ThemeHandle = ThemeHandle()

  proc get*(handle: ThemeHandle): string =
    let raw = jsLocalStorageGet(themeKey)
    if raw.len == 0:
      "light"
    else:
      normalize($raw)

  proc set*(handle: ThemeHandle; themeName: string) =
    let normalized = normalize(themeName)
    jsLocalStorageSet(themeKey, cstring(normalized))
