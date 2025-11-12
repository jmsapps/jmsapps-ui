when defined(js):
  import "ntml"

  styled SliderContainer = d:
    """
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
      padding: 0.1rem 0.35rem;
      border-radius: 999px;
      background: var(--slider-shell-bg, transparent);
    """

  styled SliderLabel = label:
    """
      position: relative;
      width: 54px;
      height: 26px;
      background: var(--slider-track-bg, rgba(255, 255, 255, 0.3));
      display: inline-flex;
      align-items: center;
      border-radius: 999px;
      box-shadow: 0px 2px 6px -2px rgba(0, 0, 0, 0.35);
      padding: 2px;
      cursor: pointer;

      input:checked + .slider-fill {
        left: calc(100% - 22px);
        background: var(--slider-thumb-color-active, var(--slider-thumb-color, var(--primary)));
      }
    """

  styled SliderInput = input:
    """
      position: absolute;
      opacity: 0;
      width: 0;
      height: 0;
    """

  styled SliderFill = span:
    """
      position: absolute;
      left: 2px;
      width: 22px;
      height: 22px;
      border-radius: 50%;
      background: var(--slider-thumb-color, var(--primary));
      transition: left 0.35s ease;
      box-shadow: 0 8px 18px rgba(0, 0, 0, 0.25);
    """

  styled SliderSlot = span:
    """
      min-width: 1.2rem;
      text-align: center;
      font-size: 0.9rem;
      color: var(--slider-slot-color, var(--muted));
      display: inline-flex;
      align-items: center;
      justify-content: center;
    """
