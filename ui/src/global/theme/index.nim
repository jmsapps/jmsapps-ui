when defined(js):
  import ntml

  theme LightTheme:
    primary = "#3b5bff"
    secondary = "#ff8a4c"
    tertiary = "#15c9b9"
    accent = "#8b5cf6"
    background = "linear-gradient(140deg, #f6f9ff 0%, #edf1ff 45%, #fbfbfe 100%)"
    surface = "#ffffff"
    "surface-muted" = "rgba(255, 255, 255, 0.88)"
    foreground = "#0f172a"
    muted = "#4c5773"
    white = "#ffffff"
    black = "#050912"
    grey = "#94a3b8"
    border = "rgba(15, 23, 42, 0.08)"
    highlight = "rgba(59, 91, 255, 0.08)"
    glow = "0 20px 45px rgba(59, 91, 255, 0.25)"
    shadow = "0 30px 70px rgba(15, 23, 42, 0.12)"
    "shadow-strong" = "0 40px 80px rgba(15, 23, 42, 0.2)"

  theme DarkTheme:
    primary = "#7cc0ff"
    secondary = "#fcb37b"
    tertiary = "#7bf1d8"
    accent = "#c084fc"
    background = "radial-gradient(130% 160% at 20% 10%, #111a33 0%, #060b17 50%, #01030a 100%)"
    surface = "rgba(8, 12, 24, 0.95)"
    "surface-muted" = "rgba(10, 15, 28, 0.8)"
    foreground = "#e8ecff"
    muted = "#b1b9d6"
    white = "#f8fafc"
    black = "#01030a"
    grey = "#7c87a6"
    border = "rgba(232, 236, 255, 0.12)"
    highlight = "rgba(124, 192, 255, 0.16)"
    glow = "0 30px 70px rgba(124, 192, 255, 0.32)"
    shadow = "0 40px 95px rgba(1, 3, 10, 0.65)"
    "shadow-strong" = "0 55px 110px rgba(1, 3, 10, 0.8)"

  export LightTheme, DarkTheme

# rgba(59, 91, 255, 0.8)
