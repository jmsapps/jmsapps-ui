when defined(js):
  import "ntml"
  import "strutils"

  import "styles"

  import "components/navBar/index"

  import "global/styles/index"


  proc navActiveState(location: Signal[string], path: string): Signal[string] =
    derived(location, proc (current: string): string =
      if current == path or current.startsWith(path & "/") or
          (path == "/ntml/getting-started" and current == "/ntml"):
        "true"
      else:
        "false"
    )


  proc DocsNavButton(label: string, path: string, location: Signal[string]): Node =
    NtmlDocsNavButton(
      `type`="button",
      `data-active`=navActiveState(location, path),
      onClick = proc (e: Event) = navigate(path)
    ):
      label


  proc DocsNavList(location: Signal[string]): Node =
    NtmlDocsNavList:
      NtmlDocsNavItem:
        DocsNavButton("Getting Started", "/ntml/getting-started", location)
      NtmlDocsNavItem:
        DocsNavButton("Installation", "/ntml/installation", location)
      NtmlDocsNavItem:
        DocsNavButton("Elements", "/ntml/elements", location)
      NtmlDocsNavItem:
        DocsNavButton("Signals", "/ntml/signals", location)
      NtmlDocsNavItem:
        DocsNavButton("Routing", "/ntml/routing", location)
      NtmlDocsNavItem:
        DocsNavButton("Styling", "/ntml/styling", location)


  proc DocsNavAccordion(location: Signal[string]): Node =
    NtmlDocsAccordion:
      NtmlDocsAccordionSummary:
        "Docs"
      NtmlDocsAccordionList:
        NtmlDocsNavItem:
          DocsNavButton("Getting Started", "/ntml/getting-started", location)
        NtmlDocsNavItem:
          DocsNavButton("Installation", "/ntml/installation", location)
        NtmlDocsNavItem:
          DocsNavButton("Elements", "/ntml/elements", location)
        NtmlDocsNavItem:
          DocsNavButton("Signals", "/ntml/signals", location)
        NtmlDocsNavItem:
          DocsNavButton("Routing", "/ntml/routing", location)
        NtmlDocsNavItem:
          DocsNavButton("Styling", "/ntml/styling", location)


  proc NtmlDocsLayout(
    title: string,
    subtitle: string,
    location: Signal[string],
    body: proc (): Node
  ): Node =
    Page:
      NavBar(brandText = "JMS APPS")

      NtmlDocsPage:
        NtmlDocsShell:
          NtmlDocsAside:
            NtmlDocsSideHeader:
              NtmlDocsSideTitle:
                "NTML"
              NtmlDocsSideBadge:
                "Docs"

            NtmlDocsNavGroupTitle:
              "Core"

            DocsNavList(location)
            DocsNavAccordion(location)

            NtmlDocsSideFooter:
              NtmlDocsMetaTag:
                "v0.5.1"
              NtmlDocsMetaTag:
                "JS target"

          NtmlDocsMain:
            NtmlDocsHeader:
              NtmlDocsKicker:
                "Documentation"
              NtmlDocsTitle:
                title
              NtmlDocsSubtitle:
                subtitle

            body()


  proc NtmlDocsGettingStarted*(): Node =
    let location = router().location

    NtmlDocsLayout(
      title = "Getting Started",
      subtitle = "Build your first NTML view and understand the basic building blocks.",
      location = location,
      body = proc (): Node =
        fragment:
          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Hello, NTML"
            NtmlDocsParagraph:
              "Views are Nim procs that return a Node. Compose them like functions and render once."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "when defined(js):\n"
                "  import ntml\n"
                "\n"
                "  proc App*(): Node =\n"
                "    d(className=\"app\"):\n"
                "      h1: \"Hello, NTML\"\n"

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Mounting"
            NtmlDocsParagraph:
              "Render your top-level component once. The framework wires signals and DOM updates."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "when defined(js):\n"
                "  render(App())\n"

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Composition"
            NtmlDocsParagraph:
              "Components can return other components. Keep them small and focused."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "proc Button*(label: string): Node =\n"
                "  button(className=\"btn\"):\n"
                "    label\n"
    )


  proc NtmlDocsInstallation*(): Node =
    let location = router().location

    NtmlDocsLayout(
      title = "Installation",
      subtitle = "Add NTML to your Nimble project and target JavaScript.",
      location = location,
      body = proc (): Node =
        fragment:
          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Nimble dependency"
            NtmlDocsParagraph:
              "Add the Git dependency to your .nimble file."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "requires \"https://github.com/jmsapps/ntml >= 0.5.1\"\n"

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Install locally"
            NtmlDocsParagraph:
              "Install the package or let Nimble fetch it automatically on build."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "nimble install ntml\n"

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "JS target"
            NtmlDocsParagraph:
              "NTML is designed for the JS target. Compile with nim js or the tooling in your build."
    )


  proc NtmlDocsElements*(): Node =
    let location = router().location

    NtmlDocsLayout(
      title = "Elements",
      subtitle = "HTML tags are macros. Pass attributes, handlers, and children.",
      location = location,
      body = proc (): Node =
        fragment:
          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Tag macros"
            NtmlDocsParagraph:
              "Most HTML tags are available. A few aliases exist: div is d, template is tmpl, object is obj."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "d(className=\"panel\"):\n"
                "  h2: \"Panel title\"\n"
                "  p: \"Body content\"\n"

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Attributes"
            NtmlDocsParagraph:
              "Use named attributes just like HTML. Event handlers start with on."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "button(`type`=\"button\", onClick = proc (e: Event) = echo \"clicked\"):\n"
                "  \"Click me\"\n"
    )


  proc NtmlDocsSignals*(): Node =
    let location = router().location

    NtmlDocsLayout(
      title = "Signals",
      subtitle = "Signals are the reactive primitive for stateful UIs.",
      location = location,
      body = proc (): Node =
        fragment:
          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Create and set"
            NtmlDocsParagraph:
              "Signals store state and notify subscribers when they change."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "let count = signal(0)\n"
                "count.set(count.get() + 1)\n"

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Derived values"
            NtmlDocsParagraph:
              "Use derived to map a signal into a computed value."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "let status = derived(count, proc (v: int): string =\n"
                "  if v == 1: \"One\"\n"
                "  else: $v\n"
                ")\n"
    )


  proc NtmlDocsRouting*(): Node =
    let location = router().location

    NtmlDocsLayout(
      title = "Routing",
      subtitle = "Map URL paths to components and navigate without full reloads.",
      location = location,
      body = proc (): Node =
        fragment:
          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Define routes"
            NtmlDocsParagraph:
              "Routes are matched by exact path. You can nest Route blocks to build longer paths."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "let router = router()\n"
                "Routes(router.location):\n"
                "  Route(path=\"/\", component=Home)\n"
                "  Route(path=\"/ntml/getting-started\", component=NtmlDocsGettingStarted)\n"

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Navigate"
            NtmlDocsParagraph:
              "Use navigate() from events to change routes."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "button(onClick = proc (e: Event) = navigate(\"/ntml/installation\")):\n"
                "  \"Install\"\n"
    )


  proc NtmlDocsStyling*(): Node =
    let location = router().location

    NtmlDocsLayout(
      title = "Styling",
      subtitle = "Use styled components or inline css for quick layout.",
      location = location,
      body = proc (): Node =
        fragment:
          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Styled components"
            NtmlDocsParagraph:
              "The styled macro creates a named component with CSS attached."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "styled Card = d:\n"
                "  \"\"\"\n"
                "  padding: 1.5rem;\n"
                "  border-radius: 1rem;\n"
                "  \"\"\""

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Inline css"
            NtmlDocsParagraph:
              "Use the css attribute to inject styles once and reuse a generated class."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "d(css = \"background: #111; color: #fff; padding: 1rem;\"):\n"
                "  \"Inline styling\"\n"
    )
