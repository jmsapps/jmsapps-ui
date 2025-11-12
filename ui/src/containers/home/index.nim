when defined(js):
  import "ntml"

  styled Page = d:
    """
      position: absolute;
      top: 0;
      right: 0;
      bottom: 0;
      left: 0;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      background: var(--primary);
      color: var(--black);
      font-family: 'Inter', 'Roboto', sans-serif;
    """

  styled HeaderBar = header:
    """
      text-align: center;
      padding: 32px 16px 16px;
      color: var(--white);
      background: var(--primary);
      box-shadow: var(--shadow);
    """

  styled HeroSection = section:
    """
      max-width: 900px;
      width: 100%;
      align-self: center;
      padding: 48px 24px 32px;
      text-align: center;
      display: flex;
      flex-direction: column;
      gap: 24px;
    """

  styled HeroTitle = h1:
    """
      font-size: clamp(2rem, 4vw, 3rem);
      line-height: 1.2;
      color: var(--foreground);
      margin: 0;
    """

  styled HeroLead = p:
    """
      font-size: 1.2rem;
      line-height: 1.7;
      color: var(--foreground);
      margin: 0 auto;
    """

  styled PortfolioGrid = d:
    """
      display: flex;
      flex-wrap: wrap;
      gap: 12px;
      justify-content: center;
      margin: 12px 0 8px;
    """

  styled PortfolioLink = a:
    """
      border: 2px solid var(--primary);
      color: var(--primary);
      text-decoration: none;
      padding: 12px 18px;
      border-radius: 100px;
      font-weight: 600;
      transition: transform 0.2s ease, background 0.2s ease, color 0.2s ease;
      min-width: 180px;
      text-align: center;
      display: inline-flex;
      justify-content: center;
      &:hover {
        background: var(--primary);
        color: var(--white);
        transform: translateY(-2px);
      }
    """

  styled PrimaryAction = a:
    """
      background: var(--primary);
      color: var(--white);
      border-radius: 999px;
      padding: 14px 28px;
      font-weight: 600;
      text-decoration: none;
      margin: 0 8px;
      display: inline-flex;
      justify-content: center;
      transition: transform 0.2s ease, box-shadow 0.2s ease;
      box-shadow: var(--shadow;
      &:hover {
        transform: translateY(-2px);
        box-shadow: var(--shadow;
      }
    """

  styled SecondaryAction = a:
    """
      border: 2px solid var(--secondary);
      color: var(--secondary);
      border-radius: 999px;
      padding: 12px 24px;
      font-weight: 600;
      text-decoration: none;
      margin: 0 8px;
      display: inline-flex;
      justify-content: center;
      transition: transform 0.2s ease, background 0.2s ease, color 0.2s ease;
      &:hover {
        background: var(--secondary);
        color: var(--black);
        transform: translateY(-2px);
      }
    """

  styled ButtonRow = d:
    """
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 12px;
      margin: 12px 0 20px;
    """

  styled ContactCard = d:
    """
      width: 100%;
      background: var(--white);
      border-radius: 18px;
      padding: 24px;
      box-shadow: var(--shadow);
      display: flex;
      flex-direction: column;
      gap: 12px;
    """

  styled ContactRow = d:
    """
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 16px;
      font-size: 1rem;
    """

  styled ContactLink = a:
    """
      color: var(--primary);
      text-decoration: none;
      font-weight: 600;
    """

  styled ContactText = p:
    """
      margin: 0;
      color: var(--grey);
    """

  proc Home*(): Node =
    Page:
      HeaderBar:
        h2: "JMS Apps — Innovative Software Solutions"

      HeroSection:
        HeroTitle:
          "Building reliable, human-centered software for modern teams."

        HeroLead:
          "From prototypes to production systems, I craft performant apps, lead teams, and obsess over the details that move a product from idea to impact."

        PortfolioGrid:
          PortfolioLink(href = "https://familyalbums.ca", target = "_blank"):
            "Family Albums"
          PortfolioLink(href = "https://admin.realtyhost.ca", target = "_blank"):
            "Realty Host"
          PortfolioLink(href = "https://markbotelho.com", target = "_blank"):
            "Mark Botelho"

        ButtonRow:
          PrimaryAction(href = "assets/jeff_santos_resume.pdf", target = "_blank", rel = "noreferrer noopener"):
            "View Resume"
          SecondaryAction(href = "mailto:jmsapps@outlook.com"):
            "Email me"

        ContactCard:
          ContactRow:
            ContactLink(href = "mailto:jmsapps@outlook.com"):
              "jmsapps@outlook.com"
            ContactText:
              "|"
            ContactLink(href = "https://linkedin.com/in/jmsapps", target = "_blank", rel = "noreferrer noopener"):
              "LinkedIn"
            ContactText:
              "|"
            ContactLink(href = "https://github.com/jmsapps", target = "_blank", rel = "noreferrer noopener"):
              "GitHub"
          ContactRow:
            ContactText:
              "416-346-6069"
            ContactText:
              "•"
            ContactText:
              "Toronto, ON"
