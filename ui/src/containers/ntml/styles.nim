when defined(js):
  import "ntml"


  styled NtmlDocsPage = d:
    """
      flex: 1;
      color: var(--foreground);
      font-family: 'Space Grotesk', 'IBM Plex Sans', 'Segoe UI', sans-serif;
    """

  styled NtmlDocsShell = d:
    """
      margin: 0 auto;
      padding: clamp(1.5rem, 3vw, 2.5rem) clamp(1.25rem, 4vw, 3rem) 4rem;
      display: grid;
      grid-template-columns: minmax(220px, 260px) minmax(0, 1fr);
      gap: clamp(1.5rem, 4vw, 3.5rem);
      @media (max-width: 900px) {
        grid-template-columns: 1fr;
        padding-bottom: 3rem;
      }
    """

  styled NtmlDocsAside = nav:
    """
      position: sticky;
      top: 6.5rem;
      align-self: start;
      background: var(--surface);
      border: 1px solid var(--border);
      border-radius: 1.25rem;
      padding: 1.5rem;
      box-shadow: var(--shadow);
      display: grid;
      gap: 1rem;
      @media (max-width: 900px) {
        position: relative;
        top: 0;
      }
    """

  styled NtmlDocsSideHeader = d:
    """
      display: flex;
      align-items: center;
      justify-content: space-between;
    """

  styled NtmlDocsSideTitle = h3:
    """
      margin: 0;
      font-size: 1.1rem;
      letter-spacing: 0.08em;
      text-transform: uppercase;
    """

  styled NtmlDocsSideBadge = span:
    """
      font-size: 0.75rem;
      font-weight: 700;
      padding: 0.2rem 0.6rem;
      border-radius: 999px;
      color: var(--primary);
      background: var(--highlight);
    """

  styled NtmlDocsNavGroupTitle = p:
    """
      margin: 0;
      font-size: 0.75rem;
      letter-spacing: 0.12em;
      text-transform: uppercase;
      color: var(--muted);
    """

  styled NtmlDocsNavList = ul:
    """
      list-style: none;
      margin: 0;
      padding: 0;
      display: grid;
      gap: 0.25rem;
    """

  styled NtmlDocsNavItem = li:
    """
      margin: 0;
    """

  styled NtmlDocsNavButton = button:
    """
      width: 100%;
      border: none;
      background: transparent;
      text-align: left;
      color: var(--muted);
      font-weight: 600;
      font-size: 0.95rem;
      padding: 0.45rem 0.6rem;
      border-radius: 0.6rem;
      cursor: pointer;
      transition: background 0.2s ease, color 0.2s ease, transform 0.2s ease;
      &:hover {
        color: var(--foreground);
        background: var(--highlight);
        transform: translateX(2px);
      }
      &[data-active="true"] {
        color: var(--foreground);
        background: var(--highlight);
      }
    """

  styled NtmlDocsSideFooter = d:
    """
      display: flex;
      gap: 0.5rem;
      flex-wrap: wrap;
      padding-top: 0.5rem;
      border-top: 1px solid var(--border);
    """

  styled NtmlDocsMain = main:
    """
      display: grid;
      gap: 2.5rem;
    """

  styled NtmlDocsHeader = header:
    """
      display: grid;
      gap: 0.75rem;
      padding-bottom: 1.5rem;
      border-bottom: 1px solid var(--border);
    """

  styled NtmlDocsKicker = span:
    """
      font-size: 0.8rem;
      text-transform: uppercase;
      letter-spacing: 0.2em;
      color: var(--muted);
    """

  styled NtmlDocsTitle = h1:
    """
      margin: 0;
      font-size: clamp(2.2rem, 5vw, 3.1rem);
      letter-spacing: -0.02em;
    """

  styled NtmlDocsSubtitle = p:
    """
      margin: 0;
      color: var(--muted);
      max-width: 60ch;
      line-height: 1.6;
      font-size: 1.05rem;
    """

  styled NtmlDocsSection = section:
    """
      display: grid;
      gap: 0.8rem;
    """

  styled NtmlDocsSectionTitle = h2:
    """
      margin: 0;
      font-size: 1.4rem;
      color: var(--foreground);
    """

  styled NtmlDocsParagraph = p:
    """
      margin: 0;
      color: var(--muted);
      line-height: 1.7;
      font-size: 1rem;
      max-width: 70ch;
    """

  styled NtmlDocsHeroLogo = img:
    """
      width: min(260px, 70%);
      height: auto;
      display: block;
      margin-top: 1rem;
    """

  styled NtmlDocsFeatureList = ul:
    """
      display: grid;
      gap: 0.5rem;
    """

  styled NtmlDocsFeatureItem = li:
    """
      color: var(--muted);
      line-height: 1.6;
    """

  styled NtmlDocsInlineLink = a:
    """
      color: var(--primary);
      text-decoration: none;
      font-weight: 600;
      border-bottom: 1px solid transparent;
      transition: color 0.2s ease, border-color 0.2s ease;
      &:hover {
        color: var(--foreground);
        border-color: currentColor;
      }
    """

  styled NtmlDocsCodeBlock = pre:
    """
      margin: 0;
      padding: 1rem 1.2rem;
      background: rgba(8, 12, 24, 0.9);
      color: #f8fafc;
      border-radius: 0.9rem;
      overflow-x: auto;
      box-shadow: var(--shadow);
    """

  styled NtmlDocsCode = code:
    """
      font-family: 'JetBrains Mono', 'Fira Code', 'SFMono-Regular', ui-monospace, monospace;
      font-size: 0.9rem;
      line-height: 1.6;
      display: block;
      white-space: pre;
    """

  styled NtmlDocsMetaTag = span:
    """
      font-size: 0.75rem;
      font-weight: 600;
      color: var(--foreground);
      border: 1px solid var(--border);
      padding: 0.15rem 0.5rem;
      border-radius: 999px;
    """
