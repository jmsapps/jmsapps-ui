when defined(js):
  import ntml

  proc Home*(): Node =
    d(class="home-container"):
      h1: "Home"

      button(
        onClick = proc (e: Event) =
          navigate("/ntml")
      ):
        "Read Ntml Docs"
