when defined(js):
  import ntml

  proc NtmlDocs*(): Node =
    d:
      h1: "NTML Docs"

      button(
        onClick= proc (e: Event) =
          navigate("/")
      ):
        "Go Home"
