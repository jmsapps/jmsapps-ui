when defined(js):
  import "ntml"
  import "times"

  import "types"

  import "components/navBar/index"

  import "utils/animations/index.nim"

  import "global/styles/index"


  proc Home*(): Node =
    let focusAreas = @[
      FocusArea(
        title: "Product leadership",
        copy: "Facilitate discovery, shape delivery expectations, and keep the roadmap honest while teams scale.",
        tags: @["Discovery sprints", "Roadmaps", "Stakeholders"]
      ),
      FocusArea(
        title: "System architect",
        copy: "Architect resilient software following industry best practices that stay fast as features grow.",
        tags: @["Design systems", "Performance", "Accessibility", "Maintainability"]
      ),
      FocusArea(
        title: "Cloud-native systems",
        copy: "Compose APIs, workers, and data flows on AWS, Azure, GCP and more with pragmatic monitoring baked in.",
        tags: @["AWS", "Azure", "GCP", "Observability"]
      ),
      FocusArea(
        title: "Team mentorship",
        copy: "Coach engineers and founders through technical decisions, hiring, and growth.",
        tags: @["Hiring", "Mentoring", "Playbooks"]
      )
    ]

    let caseStudies = @[
      CaseStudy(
        title: "Switch Health",
        summary: "Modern healthcare, delivering results to your doorstep.",
        impact: "4+ million Canadians served.",
        link: "http://switchhealth.ca",
        tag: "B2C SaaS"
      ),
      CaseStudy(
        title: "Tactable",
        summary: "Cloud solutions for enterprise organizations.",
        impact: "High profile clients consulted from design to implementation.",
        link: "https://tactable.io",
        tag: "B2B SaaS"
      ),
      CaseStudy(
        title: "Cardea Health",
        summary: "Revolutionary AI driven screening for clinical trials.",
        impact: "Built custom infrastructure to meet specialized needs.",
        link: "https://cardeahealth.io/",
        tag: "B2B SaaS"
      ),
      CaseStudy(
        title: "Mark Botelho: Real Estate Agent",
        summary: "Marketing site with custom property search.",
        impact: "25% lift in qualified leads after launch.",
        link: "https://markbotelho.com",
        tag: "Brand"
      )
    ]

    let metrics = @[
      (value: "5+", label: "Years leading software initiatives"),
      (value: "18", label: "Products shipped to production"),
      (value: "4", label: "Distributed teams mentored")
    ]

    let heroHighlights = @[
      "Blueprint MVPs into launch-ready releases without chaos.",
      "Pair architecture + implementation so decisions stay grounded.",
      "Coach teams to own outcomes with clear direction and feedback."
    ]

    scheduleRevealSetup()

    Page:
      NavBar

      HeroSection:
        HeroContent:
          HeroBadge:
            "Principal Engineer & Solution Architect"

          HeroTitle:
            "I lead teams that ship scalable software."

          HeroLead:
            "Partner with a builder who can zoom from roadmap to release. I combine battle-tested delivery habits to take products from blueprint to launch."

          HeroActions:
            PrimaryAction(href = "resume/jeff_santos_resume.pdf", target = "_blank", rel = "noreferrer noopener"):
              "View Resume"

        HeroPanel:
          HeroPanelHeading:
            "Currently helping clients"

          HeroPanelList:
            for highlight in heroHighlights:
              HeroPanelItem:
                highlight

      if false:
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
            "Strategy + engineering support that meets your needs."
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
                study.impact
              WorkLink(href = study.link, target = "_blank", rel = "noreferrer noopener"):
                "Visit project →"

      ContactPanel(`data-reveal`="contact"):
        ContactHeading:
          "Ready when you are."

        ContactCopy:
          "Tell me about the release you're aiming for—I'll send back a lightweight plan and timelines the same week."

        ContactActions:
          PrimaryAction(href = "mailto:jmsapps@outlook.com", target="_blank", rel = "noreferrer noopener"):
            "Contact me"

      Footer:
        "© "; now().year ; " JMS Apps. Innovative software solutions."
