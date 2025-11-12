when defined(js):
  import "ntml"
  import "times"

  import "types"
  import "styles"

  import "../../components/slider/index"

  import "../../global/theme/index"

  import "../../utils/animations/index.nim"

  proc Home*(): Node =
    let colorMode = signal(false)

    let focusAreas = @[
      FocusArea(
        title: "Product leadership",
        copy: "Facilitate discovery, shape calm delivery rituals, and keep the roadmap honest while teams scale.",
        tags: @["Discovery sprints", "Roadmaps", "Stakeholders"]
      ),
      FocusArea(
        title: "Frontend platforms",
        copy: "Architect resilient web apps with NTML, TypeScript, and Nim that stay fast as features grow.",
        tags: @["Design systems", "Performance", "Accessibility"]
      ),
      FocusArea(
        title: "Cloud-native systems",
        copy: "Compose APIs, workers, and data flows on AWS & Fly.io with pragmatic monitoring baked in.",
        tags: @["AWS", "Fly.io", "Observability"]
      ),
      FocusArea(
        title: "Team mentorship",
        copy: "Coach engineers and founders through technical decisions, hiring, and calm growth.",
        tags: @["Hiring", "Mentoring", "Playbooks"]
      )
    ]

    let caseStudies = @[
      CaseStudy(
        title: "Family Albums",
        summary: "Privacy-first photo archives for families, built with Nim + NTML and deployed globally.",
        impact: "3k families onboarded during the first six weeks.",
        link: "https://familyalbums.ca",
        tag: "Consumer"
      ),
      CaseStudy(
        title: "Realty Host",
        summary: "Operations dashboard for boutique brokerages with workflow automation and reporting.",
        impact: "Cut onboarding from 10 days to 3 with guided flows.",
        link: "https://admin.realtyhost.ca/login",
        tag: "B2B SaaS"
      ),
      CaseStudy(
        title: "MarkBotelho.com",
        summary: "High-converting marketing site with custom CMS hooks and lightning-fast pages.",
        impact: "25% lift in qualified leads after launch.",
        link: "https://markbotelho.com",
        tag: "Brand"
      )
    ]

    let metrics = @[
      (value: "12+", label: "Years leading software initiatives"),
      (value: "18", label: "Products shipped to production"),
      (value: "4", label: "Distributed teams mentored")
    ]

    let heroHighlights = @[
      "Blueprint MVPs into launch-ready releases without chaos.",
      "Pair architecture + implementation so decisions stay grounded.",
      "Coach teams to own outcomes with clear rituals and feedback."
    ]

    scheduleRevealSetup()

    Page:
      NavBar:
        BrandButton(`type`="button", onClick = proc (e: Event) = navigate("/")):
          "JMS APPS"

        NavLinks:
          NavButton(`type`="button", onClick = proc (e: Event) = navigate("/")):
            "Home"

          NavButton(`type`="button", onClick = proc (e: Event) = navigate("/ntml")):
            "NTML Docs"

          NavToggleWrap:
            Slider(
              state = colorMode,
              labelText = "Toggle color mode",
              colors = SliderColors(
                track: "rgba(255, 255, 255, 0.25)",
                thumb: "#ffffff",
                thumbActive: "#7cc0ff"
              ),
              leftSlot = block:
                sliderSlot:
                  span: "☀️",
              rightSlot = block:
                sliderSlot:
                  span: "🌙",
              onToggle = proc (next: bool) =
                if next:
                  setStyledTheme(DarkTheme)
                else:
                  setStyledTheme(LightTheme)
            )

          NavResume(href = "assets/jeff_santos_resume.pdf", target = "_blank", rel = "noreferrer noopener"):
            "Download Resume"

      HeroSection:
        HeroContent:
          HeroBadge:
            "Fractional CTO & Principal Engineer"

          HeroTitle:
            "I lead teams that ship thoughtful software without burning out."

          HeroLead:
            "Partner with a builder who can zoom from roadmap to release. I combine Nim, NTML, and battle-tested delivery habits to take products from brief to launch with clarity."

          HeroActions:
            PrimaryAction(href = "assets/jeff_santos_resume.pdf", target = "_blank", rel = "noreferrer noopener"):
              "Download Resume"

            SecondaryAction(`type`="button", onClick = proc (e: Event) = navigate("/ntml")):
              "Explore NTML Docs"

        HeroPanel:
          HeroPanelHeading:
            "Currently helping teams"

          HeroPanelList:
            for highlight in heroHighlights:
              HeroPanelItem:
                highlight

      MetricsRow(`data-reveal`="metrics", `data-reveal-delay`="120ms"):
        for metric in metrics:
          MetricCard:
            MetricValue:
              metric.value
            MetricLabel:
              metric.label

      SectionBlock(`data-reveal`="focus"):
        SectionHeader:
          SectionEyebrow:
            "Practice areas"
          SectionTitle:
            "Strategy + engineering support that meets your runway."
          SectionCopy:
            "Bring me in to guide discovery, architect platforms, or coach the team that will own it. I embed with founders, PMs, and engineers to keep the work steady."

        FocusGrid:
          for idx, area in focusAreas:
            let delay = $(idx * 90) & "ms"
            FocusCard(`data-reveal`="focus-card", `data-reveal-delay`=delay):
              FocusTitle:
                area.title
              FocusCopy:
                area.copy
              TagList:
                for tag in area.tags:
                  TagChip:
                    tag

      if false:
        SectionBlock(`data-reveal`="work"):
          SectionHeader:
            SectionEyebrow:
              "Selected work"
            SectionTitle:
              "Launch partners who trusted the process."
            SectionCopy:
              "A sample of recent engagements blending architecture, delivery, and mentorship."

          WorkGrid:
            for idx, study in caseStudies:
              let delay = $(idx * 120 + 120) & "ms"
              WorkCard(`data-reveal`="case-study", `data-reveal-delay`=delay):
                WorkTag:
                  study.tag
                WorkTitle:
                  study.title
                WorkSummary:
                  study.summary
                WorkMeta:
                  "Result: " & study.impact
                WorkLink(href = study.link, target = "_blank", rel = "noreferrer noopener"):
                  "Visit project ->"

      ContactPanel(`data-reveal`="contact"):
        ContactHeading:
          "Ready when you are."
        ContactCopy:
          "Tell me about the release you're aiming for—I'll send back a lightweight plan and timelines the same week."
        ContactActions:
          PrimaryAction(href = "mailto:jmsapps@outlook.com"):
            "Book a call"
          SecondaryAction(`type`="button", onClick = proc (e: Event) = navigate("/ntml")):
            "Read NTML Docs"
        ContactCopy:
          "Prefer async? Email "
          ContactLink(href = "mailto:jmsapps@outlook.com"):
            "jmsapps@outlook.com"

      Footer:
        "© "; now().year ; " JMS Apps · Building calm, resilient software."
