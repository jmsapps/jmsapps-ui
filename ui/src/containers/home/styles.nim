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
      background: var(--background);
      color: var(--foreground);
      display: flex;
      flex-direction: column;
      gap: 32px;
      font-family: 'Inter', 'Roboto', sans-serif;
      overflow-x: hidden;
    """

  styled NavBar = nav:
    """
      position: sticky;
      top: 0;
      z-index: 20;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 1rem clamp(1.25rem, 4vw, 4rem);
      background: var(--surface-muted, rgba(255, 255, 255, 0.9));
      backdrop-filter: blur(18px);
      border-bottom: 1px solid var(--border);
      box-shadow: var(--shadow);
    """

  styled BrandButton = button:
    """
      border: none;
      background: transparent;
      color: var(--foreground);
      font-weight: 700;
      letter-spacing: 0.08em;
      font-size: 1rem;
      cursor: pointer;
      padding: 0.35rem 0.5rem;
    """

  styled NavLinks = d:
    """
      display: flex;
      align-items: center;
      gap: 0.5rem;
    """

  styled NavToggleWrap = d:
    """
      display: inline-flex;
      align-items: center;
      gap: 0.4rem;
      padding-left: 1rem;
      margin-left: 0.5rem;
      border-left: 1px solid var(--border);
    """

  styled NavButton = button:
    """
      border: none;
      background: transparent;
      color: var(--muted);
      font-weight: 600;
      padding: 0.45rem 1rem;
      border-radius: 999px;
      cursor: pointer;
      transition: color 0.2s ease, background 0.2s ease, transform 0.2s ease;
      &:hover {
        color: var(--foreground);
        background: var(--highlight);
        transform: translateY(-1px);
      }
    """

  styled NavResume = a:
    """
      background-image: linear-gradient(130deg, var(--primary), var(--accent, var(--secondary)));
      color: var(--white);
      border-radius: 999px;
      padding: 0.55rem 1.2rem;
      font-weight: 600;
      text-decoration: none;
      border: 1px solid rgba(255, 255, 255, 0.18);
      box-shadow: 0 18px 40px rgba(11, 17, 45, 0.35), var(--glow);
      display: inline-flex;
      align-items: center;
      justify-content: center;
      transition: transform 0.2s ease, box-shadow 0.2s ease, filter 0.2s ease;
      &:hover {
        transform: translateY(-2px);
        box-shadow: 0 25px 55px rgba(11, 17, 45, 0.45);
        filter: brightness(1.05);
      }
    """

  styled HeroSection = section:
    """
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: clamp(2rem, 4vw, 4rem);
      padding: clamp(2rem, 6vw, 5rem) clamp(1.25rem, 6vw, 5rem) 0;
      align-items: center;
    """

  styled HeroContent = d:
    """
      display: flex;
      flex-direction: column;
      gap: 1.25rem;
    """

  styled HeroBadge = span:
    """
      display: inline-flex;
      align-items: center;
      gap: 0.35rem;
      padding: 0.35rem 0.85rem;
      border-radius: 999px;
      background: var(--highlight);
      color: var(--primary);
      font-weight: 600;
      font-size: 0.85rem;
      width: fit-content;
    """

  styled HeroTitle = h1:
    """
      font-size: clamp(2.4rem, 6vw, 3.5rem);
      line-height: 1.15;
      margin: 0;
      color: var(--foreground);
    """

  styled HeroLead = p:
    """
      color: var(--muted);
      line-height: 1.7;
      font-size: 1.15rem;
      margin: 0;
      max-width: 55ch;
    """

  styled HeroActions = d:
    """
      display: flex;
      flex-wrap: wrap;
      gap: 0.75rem;
    """

  styled PrimaryAction = a:
    """
      background-image: linear-gradient(125deg, var(--primary), var(--accent, var(--secondary)));
      color: var(--white);
      border-radius: 999px;
      padding: 0.95rem 2rem;
      font-weight: 600;
      text-decoration: none;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      border: 1px solid rgba(255, 255, 255, 0.18);
      box-shadow: 0 18px 35px rgba(59, 91, 255, 0.35);
      transition: transform 0.2s ease, box-shadow 0.2s ease, filter 0.2s ease;
      &:hover {
        background-image: none;
        border-color: rgba(255, 255, 255, 0.6);
        background-color: var(--primary);
        transform: translateY(-2px);
      }
    """

  styled SecondaryAction = button:
    """
      border: 1.5px solid rgba(255, 255, 255, 0.35);
      background: var(--accent);
      color: var(--white);
      border-radius: 999px;
      padding: 0.9rem 1.75rem;
      font-weight: 600;
      cursor: pointer;
      backdrop-filter: blur(14px);
      transition: color 0.2s ease, border-color 0.2s ease, transform 0.2s ease, background 0.2s ease;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      &:hover {
        border-color: rgba(255, 255, 255, 0.6);
        background-color: var(--primary);
        transform: translateY(-2px);
      }
    """

  styled HeroPanel = d:
    """
      background: var(--surface);
      border-radius: 24px;
      padding: 1.8rem;
      border: 1px solid var(--border);
      box-shadow: var(--shadow);
      display: flex;
      flex-direction: column;
      gap: 1rem;
    """

  styled HeroPanelHeading = h3:
    """
      margin: 0;
      font-size: 1rem;
      text-transform: uppercase;
      letter-spacing: 0.1em;
      color: var(--muted);
    """

  styled HeroPanelList = d:
    """
      display: flex;
      flex-direction: column;
      gap: 0.85rem;
    """

  styled HeroPanelItem = p:
    """
      margin: 0;
      padding-left: 1.5rem;
      position: relative;
      color: var(--foreground);
      line-height: 1.6;
      &:before {
        content: "";
        position: absolute;
        left: 0;
        top: 0.55rem;
        width: 0.5rem;
        height: 0.5rem;
        border-radius: 999px;
        background: var(--primary);
        box-shadow: 0 0 12px rgba(59, 91, 255, 0.35);
      }
    """

  styled MetricsRow = d:
    """
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
      gap: 1rem;
      padding: 0 clamp(1.25rem, 6vw, 5rem);
      opacity: 0;
      transform: translateY(32px);
      transition: opacity 0.6s ease, transform 0.6s ease;
      transition-delay: var(--reveal-delay, 0ms);
      &.is-visible {
        opacity: 1;
        transform: translateY(0);
      }
    """

  styled MetricCard = article:
    """
      background: var(--surface);
      border-radius: 20px;
      padding: 1.35rem;
      border: 1px solid var(--border);
      box-shadow: var(--shadow);
      display: flex;
      flex-direction: column;
      gap: 0.45rem;
    """

  styled MetricValue = strong:
    """
      font-size: 2rem;
      color: var(--primary);
      line-height: 1;
    """

  styled MetricLabel = span:
    """
      color: var(--muted);
      font-size: 0.9rem;
    """

  styled SectionBlock = section:
    """
      padding: clamp(2rem, 6vw, 4rem) clamp(1.25rem, 6vw, 5rem);
      display: flex;
      flex-direction: column;
      gap: 1.5rem;
      opacity: 0;
      transform: translateY(40px);
      transition: opacity 0.6s ease, transform 0.6s ease;
      transition-delay: var(--reveal-delay, 0ms);
      &.is-visible {
        opacity: 1;
        transform: translateY(0);
      }
    """

  styled SectionHeader = header:
    """
      display: flex;
      flex-direction: column;
      gap: 0.5rem;
      max-width: 760px;
    """

  styled SectionEyebrow = span:
    """
      text-transform: uppercase;
      letter-spacing: 0.15em;
      font-size: 0.8rem;
      color: var(--muted);
    """

  styled SectionTitle = h2:
    """
      margin: 0;
      font-size: clamp(1.8rem, 4vw, 2.4rem);
      color: var(--foreground);
    """

  styled SectionCopy = p:
    """
      margin: 0;
      color: var(--muted);
      line-height: 1.7;
    """

  styled FocusGrid = d:
    """
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
      gap: 1.5rem;
    """

  styled FocusCard = article:
    """
      background: var(--surface);
      border-radius: 20px;
      padding: 1.5rem;
      border: 1px solid var(--border);
      box-shadow: var(--shadow);
      display: flex;
      flex-direction: column;
      gap: 0.85rem;
      opacity: 0;
      transform: translateY(35px);
      transition: opacity 0.6s ease, transform 0.6s ease;
      transition-delay: var(--reveal-delay, 0ms);
      &:hover {
        border-color: var(--primary);
        transform: translateY(-6px);
      }
      &.is-visible {
        opacity: 1;
        transform: translateY(0);
      }
    """

  styled FocusTitle = h3:
    """
      margin: 0;
      font-size: 1.2rem;
    """

  styled FocusCopy = p:
    """
      margin: 0;
      color: var(--muted);
      line-height: 1.6;
    """

  styled TagList = d:
    """
      display: flex;
      flex-wrap: wrap;
      gap: 0.45rem;
      margin-top: auto;
    """

  styled TagChip = span:
    """
      padding: 0.25rem 0.65rem;
      border-radius: 999px;
      background: var(--highlight);
      color: var(--primary);
      font-size: 0.8rem;
      font-weight: 600;
    """

  styled WorkGrid = d:
    """
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
      gap: 1.5rem;
    """

  styled WorkCard = article:
    """
      background: var(--surface);
      border-radius: 24px;
      padding: 1.6rem;
      border: 1px solid var(--border);
      box-shadow: var(--shadow);
      display: flex;
      flex-direction: column;
      gap: 0.75rem;
      opacity: 0;
      transform: translateY(35px);
      transition: opacity 0.6s ease, transform 0.6s ease;
      transition-delay: var(--reveal-delay, 0ms);
      &:hover {
        border-color: var(--secondary);
        transform: translateY(-6px);
      }
      &.is-visible {
        opacity: 1;
        transform: translateY(0);
      }
    """

  styled WorkTag = span:
    """
      font-size: 0.85rem;
      text-transform: uppercase;
      letter-spacing: 0.1em;
      color: var(--secondary);
    """

  styled WorkTitle = h3:
    """
      margin: 0;
      font-size: 1.3rem;
    """

  styled WorkSummary = p:
    """
      margin: 0;
      color: var(--muted);
      line-height: 1.6;
    """

  styled WorkMeta = p:
    """
      margin: 0;
      color: var(--foreground);
      font-weight: 600;
    """

  styled WorkLink = a:
    """
      margin-top: auto;
      display: inline-flex;
      align-items: center;
      gap: 0.35rem;
      color: var(--primary);
      text-decoration: none;
      font-weight: 600;
    """

  styled ContactPanel = section:
    """
      margin: 0 clamp(1.25rem, 6vw, 5rem) clamp(3rem, 8vw, 5rem);
      background:
        radial-gradient(circle at top left, rgba(255, 255, 255, 0.1), transparent 45%),
        linear-gradient(135deg, rgba(95, 159, 219, 0.78), rgba(252, 179, 123, 0.13));
      backdrop-filter: blur(18px);
      border-radius: 32px;
      padding: clamp(2rem, 5vw, 3.5rem);
      color: var(--foreground);
      box-shadow: var(--shadow-strong, 0 35px 80px rgba(3, 5, 8, 0.45));
      display: flex;
      flex-direction: column;
      gap: 1rem;
      opacity: 0;
      transform: translateY(35px);
      transition: opacity 0.6s ease, transform 0.6s ease;
      transition-delay: var(--reveal-delay, 0ms);
      &.is-visible {
        opacity: 1;
        transform: translateY(0);
      }
    """

  styled ContactHeading = h3:
    """
      margin: 0;
      font-size: clamp(1.4rem, 3vw, 2rem);
      color: var(--foreground);
    """

  styled ContactCopy = p:
    """
      margin: 0;
      color: color-mix(in srgb, var(--foreground) 85%, rgba(255, 255, 255, 0.7));
      line-height: 1.7;
    """

  styled ContactActions = d:
    """
      display: flex;
      flex-wrap: wrap;
      gap: 0.75rem;
    """

  styled ContactLink = a:
    """
      color: var(--foreground);
      text-decoration: underline;
      font-weight: 600;
    """

  styled Footer = footer:
    """
      text-align: center;
      padding: 2rem;
      color: var(--muted);
      font-size: 0.9rem;
    """
