when defined(js):
  import "ntml"

  styled NavBarContainer = nav:
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

  styled BrandLogo = img:
    """
      height: 32px;
      display: block;
    """

  styled NavToggleWrap = d:
    """
      display: inline-flex;
      align-items: center;
      gap: 0.4rem;
      padding-left: 1rem;
      margin-left: 0.5rem;
      border-left: 1px solid var(--border);

      @media (max-width: 900px) {
        padding-left: 0;
      }
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

  styled NavLinks = d:
    """
      display: flex;
      align-items: center;
      gap: 0.5rem;
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
