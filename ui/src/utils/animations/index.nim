when defined(js):
  import "std/jsffi"

  import "types"

  var revealObserver: IntersectionObserver

  proc newIntersectionObserver*(
    cb: IntersectionObserverCallback;
    options: JsObject = nil
  ): IntersectionObserver
    {.importjs: "new IntersectionObserver(#,#)".}


  proc observe*(obs: IntersectionObserver; node: DomNode) {.importjs: "#.observe(#)".}


  proc querySelectorAll*(sel: cstring): seq[DomNode]
    {.importjs: "Array.from(document.querySelectorAll(#))".}


  proc entryIsIntersecting*(entry: IntersectionObserverEntry): bool
    {.importjs: "#.isIntersecting".}


  proc entryTarget*(entry: IntersectionObserverEntry): DomNode
    {.importjs: "#.target".}


  proc addClass*(node: DomNode; cls: cstring) {.importjs: "#.classList.add(#)".}


  proc setStyle*(node: DomNode; prop, value: cstring) {.importjs: "#.style.setProperty(#,#)".}


  proc getAttribute*(node: DomNode; name: cstring): cstring {.importjs: "#.getAttribute(#)".}


  proc matchMedia(query: cstring): JsObject {.importjs: "window.matchMedia(#)".}


  proc mediaMatches(handle: JsObject): bool {.importjs: "#.matches".}


  proc requestAnimationFrame(cb: proc ()) {.importjs: "window.requestAnimationFrame(#)".}


  proc setTimeout(cb: proc (), ms: int): JsObject {.importjs: "setTimeout(#,#)".}


  proc ensureObserver(): IntersectionObserver =
    if revealObserver.isNil:
      revealObserver = newIntersectionObserver(proc(entries: seq[IntersectionObserverEntry]) =
        for entry in entries:
          if entryIsIntersecting(entry):
            addClass(entryTarget(entry), cstring("is-visible"))
      )
    revealObserver


  proc scheduleRevealSetup* =
    proc setup() =
      let nodes = querySelectorAll(cstring("[data-reveal]"))

      if nodes.len == 0:
        return

      let reduced = mediaMatches(matchMedia(cstring("(prefers-reduced-motion: reduce)")))
      var observer: IntersectionObserver = nil

      if not reduced:
        observer = ensureObserver()

      for node in nodes:
        let delay = getAttribute(node, cstring("data-reveal-delay"))

        if delay.len > 0:
          setStyle(node, cstring("--reveal-delay"), delay)

        if reduced or observer.isNil:
          addClass(node, cstring("is-visible"))
        else:
          observe(observer, node)

    try:
      requestAnimationFrame(setup)
    except:
      discard setTimeout(setup, 16)
