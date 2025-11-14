when defined(js):
  import "ntml"

  import "styles"

  import "types"

  proc Slider*(
    isToggled: Signal[bool];
    onToggle: proc (next: bool) = nil;
    labelText: string = "Toggle option";
    leftSlot: Node = nil;
    rightSlot: Node = nil;
    colors: SliderColors = SliderColors()
  ): Node =
    let trackColor = if colors.track.len > 0: colors.track else: "var(--grey)"
    let thumbColor = if colors.thumb.len > 0: colors.thumb else: "var(--primary)"
    let thumbActive = if colors.thumbActive.len > 0: colors.thumbActive else: thumbColor

    SliderContainer:
      if not leftSlot.isNil:
        SliderSlot:
          leftSlot

      SliderLabel(
        ariaLabel = labelText,
        styleVars = styleVars("--slider-track-bg" = trackColor)
      ):
        SliderInput(
          `type`="checkbox",
          name="slider-input",
          ariaLabel = labelText,
          checked = isToggled,
          onChange = proc (e: Event) =
            let next = isToggled.get()

            if not onToggle.isNil:
              onToggle(next)
        )
        SliderFill(
          class = "slider-fill",
          styleVars = styleVars(
            "--slider-thumb-color" = thumbColor,
            "--slider-thumb-color-active" = thumbActive
          )
        )

      if not rightSlot.isNil:
        SliderSlot:
          rightSlot

export SliderColors
