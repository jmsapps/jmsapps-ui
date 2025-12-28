when defined(js):
  import "ntml"
  import "strutils"

  import "styles"

  import "components/navBar/index"

  import "global/styles/index"


  proc navActiveState(location: Signal[string], path: string): Signal[string] =
    derived(location, proc (current: string): string =
      if current == path or current.startsWith(path & "/") or
          (path == "/ntml/overview" and current == "/ntml"):
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


  proc DocsNavListCore(location: Signal[string]): Node =
    NtmlDocsNavList:
      NtmlDocsNavItem:
        DocsNavButton("Overview", "/ntml/overview", location)
      NtmlDocsNavItem:
        DocsNavButton("Getting Started", "/ntml/getting-started", location)
      NtmlDocsNavItem:
        DocsNavButton("Elements", "/ntml/elements", location)
      NtmlDocsNavItem:
        DocsNavButton("Signals", "/ntml/signals", location)
      NtmlDocsNavItem:
        DocsNavButton("Effects", "/ntml/effects", location)


  proc DocsNavListPatterns(location: Signal[string]): Node =
    NtmlDocsNavList:
      NtmlDocsNavItem:
        DocsNavButton("Control Flow", "/ntml/control-flow", location)
      NtmlDocsNavItem:
        DocsNavButton("Routing", "/ntml/routing", location)
      NtmlDocsNavItem:
        DocsNavButton("Styling", "/ntml/styling", location)
      NtmlDocsNavItem:
        DocsNavButton("Forms", "/ntml/forms", location)


  proc NtmlDocsLayout(
    title: string,
    subtitle: string,
    location: Signal[string],
    body: proc (): Node
  ): Node =
    Page:
      NavBar

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

            DocsNavListCore(location)

            NtmlDocsNavGroupTitle:
              "Patterns"

            DocsNavListPatterns(location)

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


  proc NtmlDocsOverview*(): Node =
    let location = router().location

    NtmlDocsLayout(
      title = "NTML",
      subtitle = "The next-gen-reactive template markup language.",
      location = location,
      body = proc (): Node =
        fragment:
          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Overview"
            NtmlDocsParagraph:
              "NTML is a reactive client-side single page application renderer written in Nim. "
              "It provides a lightweight signal and effect system, and a JSX-like DSL for composing "
              "DOM nodes with reactive updates."

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Features"
            NtmlDocsFeatureList:
              NtmlDocsFeatureItem:
                strong: "Signals"
                span: " reactive primitives for state management."
              NtmlDocsFeatureItem:
                strong: "Derived Signals"
                span: " automatically compute values from other signals."
              NtmlDocsFeatureItem:
                strong: "Effects"
                span: " side effects that run in response to signal changes."
              NtmlDocsFeatureItem:
                strong: "DOM Helpers"
                span: " simple wrappers for element creation and updates."
              NtmlDocsFeatureItem:
                strong: "Control Flow"
                span: " templates for if, case, and loops inside the DSL."
              NtmlDocsFeatureItem:
                strong: "Component Props"
                span: " composable component definitions with inheritance support."
              NtmlDocsFeatureItem:
                strong: "Routing"
                span: " simple and intuitive routing with navigate()."
              NtmlDocsFeatureItem:
                strong: "Styled Components"
                span: " reactive styled macro keeps components clean and organized."
              NtmlDocsFeatureItem:
                strong: "Form Bindings"
                span: " built-in bindValue and bindChecked wire signals to form inputs."
              NtmlDocsFeatureItem:
                strong: "Lifecycle Cleanup"
                span: " automatic teardown releases subscriptions, events, and styles."
              NtmlDocsFeatureItem:
                strong: "Signal Operators"
                span: " overloads let you compose comparisons and boolean logic on Signals."
              NtmlDocsFeatureItem:
                strong: "Reactive CSS Vars"
                span: " styleVars keeps CSS custom properties synced with signals."
              NtmlDocsFeatureItem:
                strong: "Keyed List Rendering"
                span: " reconciles list updates and preserves element identity."

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Source and contribution"
            NtmlDocsParagraph:
              "View the source, issues, and contribution history at "
              NtmlDocsInlineLink(href="https://github.com/jmsapps/ntml", target="_blank", rel="noreferrer noopener"):
                "github.com/jmsapps/ntml"
              "."
    )


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
              "Installation"
            NtmlDocsParagraph:
              "Add the Git dependency to your .nimble file."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "requires \"https://github.com/jmsapps/ntml >= 0.5.1\"\n"

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "JS target"
            NtmlDocsParagraph:
              "NTML is designed for the JS target. "
              "You'll need an index.html file to serve your application from."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "<!DOCTYPE html>\n"
                "<html lang=\"en\">\n"
                "  <head>\n"
                "    <meta charset=\"UTF-8\" />\n"
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n"
                "    <title>Run Nim-Generated JS</title>\n"
                "  </head>\n"
                "  <body>\n"
                "    <script src=\"/index.js\"></script>\n"
                "  </body>\n"
                "</html>"

            NtmlDocsParagraph:
              "You can then build your project, specifying an target path for your js file as needed."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "nim js --out:src/index.js src/app.nim\n"

            NtmlDocsParagraph:
              "Finally you can serve your project with npx."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "npx serve --single src"

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

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "State at a glance"
            NtmlDocsParagraph:
              "Signals hold state and can be mounted directly as children."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "let count = signal(0)\n"
                "\n"
                "d:\n"
                "  span: \"Count: \"\n"
                "  span: count\n"
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
              "Most HTML tags are available. "
              "Nim has some collisions with existing html tags, one example being the reserved "
              "keyword `div`. For this reason a few aliases exist: "
              ul:
                li: "div is d"
                li: "template is tmpl"
                li: "object is obj"
                li: "var is v"
              "The rest are what you should expect."

            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "d(className=\"panel\"):\n"
                "  h2: \"Panel title\"\n"
                "  p: \"Body content\"\n"

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Attributes"
            NtmlDocsParagraph:
              "Use named attributes just like HTML. Event handlers start with `on`."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "button(`type`=\"button\", onClick = proc (e: Event) = echo \"clicked\"):\n"
                "  \"Click me\"\n"

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Fragments"
            NtmlDocsParagraph:
              "Use fragment to return multiple siblings from a component."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "proc Header*(): Node =\n"
                "  fragment:\n"
                "    h1: \"NTML\"\n"
                "    p: \"Tiny DOM DSL\"\n"
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

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Dot expression overloads"
            NtmlDocsParagraph:
              "Accessing a field on a Signal creates a derived signal that stays in sync with the parent."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "type Profile = object\n"
                "  name: string\n"
                "  age: int\n"
                "\n"
                "let profile = signal(Profile(name: \"Ada\", age: 37))\n"
                "let nameSignal = profile.name\n"
                "\n"
                "span: nameSignal\n"
                "button(onClick = proc (e: Event) = nameSignal.set(\"Grace\")):\n"
                "  \"Rename\"\n"
    )


  proc NtmlDocsEffects*(): Node =
    let location = router().location

    NtmlDocsLayout(
      title = "Effects",
      subtitle = "Run side effects in response to signal changes and clean them up.",
      location = location,
      body = proc (): Node =
        fragment:
          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Basic effect"
            NtmlDocsParagraph:
              "Use effect with dependencies to run when signals change."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "let count = signal(0)\n"
                "discard effect(proc (): void =\n"
                "  jsLog(\"count=\" & $count.get())\n"
                ", [count])\n"

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Cleanup"
            NtmlDocsParagraph:
              "Return an Unsub to clean up listeners or timers."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "let isActive = signal(true)\n"
                "discard effect(proc (): Unsub =\n"
                "  if not isActive.get():\n"
                "    return proc () = discard\n"
                "  let handler = proc (e: Event) = jsLog(\"resize\")\n"
                "  jsAddEventListener(window, cstring(\"resize\"), handler)\n"
                "  return proc () = jsRemoveEventListener(window, cstring(\"resize\"), handler)\n"
                ", [isActive])\n"

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "One-time setup"
            NtmlDocsParagraph:
              "Call effect without deps to run once. Store the returned Unsub if you need manual cleanup."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "let cleanup = effect(proc (): void =\n"
                "  jsLog(\"mounted\")\n"
                ")\n"
                "# later: cleanup()\n"
    )


  proc NtmlDocsControlFlow*(): Node =
    let location = router().location

    NtmlDocsLayout(
      title = "Control Flow",
      subtitle = "Conditionals, loops, and keyed lists are compiled into efficient DOM updates.",
      location = location,
      body = proc (): Node =
        fragment:
          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "If and else"
            NtmlDocsParagraph:
              "Use if/elif/else in your markup. Signals work directly."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "let isReady = signal(false)\n"
                "d:\n"
                "  if isReady:\n"
                "    span: \"Loaded\"\n"
                "  else:\n"
                "    span: \"Loading...\"\n"

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Case"
            NtmlDocsParagraph:
              "case statements also work inside templates."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "let status = signal(\"idle\")\n"
                "d:\n"
                "  case status:\n"
                "  of \"idle\": span: \"Idle\"\n"
                "  of \"busy\": span: \"Working\"\n"
                "  else: span: \"Unknown\"\n"

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "For loops"
            NtmlDocsParagraph:
              "Loop over seqs or signals of seqs to render lists."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "let items = signal(@[\"Alpha\", \"Beta\", \"Gamma\"])\n"
                "ul:\n"
                "  for item in items:\n"
                "    li: item\n"

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Keyed diffs"
            NtmlDocsParagraph:
              "Add key inside the loop to enable keyed patching for reorderable lists."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "type Item = object\n"
                "  id: int\n"
                "  label: string\n"
                "\n"
                "let items = signal(@[Item(id: 1, label: \"One\"), Item(id: 2, label: \"Two\")])\n"
                "ul:\n"
                "  for item in items:\n"
                "    li(key = item.id): item.label\n"
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
                "  Route(path=\"/ntml\"):\n"
                "    Route(path=\"getting-started\", component=NtmlDocsGettingStarted)\n"
                "    Route(path=\"signals\", component=NtmlDocsSignals)\n"

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Navigate"
            NtmlDocsParagraph:
              "Use navigate() from events to change routes."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "button(onClick = proc (e: Event) = navigate(\"/ntml/getting-started\")):\n"
                "  \"Getting Started\"\n"
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

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "CSS variables"
            NtmlDocsParagraph:
              "styleVars builds CSS variables at runtime and can bind signals."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "let hue = signal(\"220\")\n"
                "let accent = derived(hue, proc (v: string): string =\n"
                "  \"hsl(\" & v & \", 90%, 60%)\"\n"
                ")\n"
                "d(styleVars = styleVars(\"--accent\" = accent)):\n"
                "  \"Dynamic color\"\n"
    )


  proc NtmlDocsForms*(): Node =
    let location = router().location

    NtmlDocsLayout(
      title = "Forms",
      subtitle = "Bind inputs to signals and handle form events explicitly.",
      location = location,
      body = proc (): Node =
        fragment:
          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Text input"
            NtmlDocsParagraph:
              "value accepts a Signal[string]. Update the signal on input."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "let name = signal(\"\")\n"
                "form:\n"
                "  input(\n"
                "    `type`=\"text\",\n"
                "    value=name,\n"
                "    onInput = proc (e: Event) =\n"
                "      let target = cast[Node](e.target)\n"
                "      name.set($jsGetStringProp(target, cstring(\"value\")))\n"
                "  )\n"
                "  p: name\n"

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Checkbox"
            NtmlDocsParagraph:
              "checked binds to Signal[bool]. Update it from onChange."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "let accepted = signal(false)\n"
                "label:\n"
                "  input(\n"
                "    `type`=\"checkbox\",\n"
                "    checked=accepted,\n"
                "    onChange = proc (e: Event) =\n"
                "      let target = cast[Node](e.target)\n"
                "      accepted.set(jsGetBoolProp(target, cstring(\"checked\")))\n"
                "  )\n"
                "  span: \"Accept terms\"\n"

          NtmlDocsSection:
            NtmlDocsSectionTitle:
              "Submit"
            NtmlDocsParagraph:
              "Handle submit events to prevent full page reloads."
            NtmlDocsCodeBlock:
              NtmlDocsCode:
                "form(onSubmit = proc (e: Event) =\n"
                "  e.preventDefault()\n"
                "  jsLog(\"submit\")\n"
                "):\n"
                "  button(`type`=\"submit\"): \"Save\"\n"
    )
