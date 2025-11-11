when defined(js):
  import ntml

  proc NotFound*(): Node =
    d:
      h1: "404"
      p: "This page does not exist."

      button(onClick = proc(e: Event) = navigate("/")):
        "Go Home"
