when defined(js):
  import "ntml"

  import "styles"

  type
    SliderColors* = object
      track*: string
      thumb*: string
      thumbActive*: string

    SliderSlotRenderer* = proc (): Node

  template sliderSlot*(body: untyped): SliderSlotRenderer =
    proc (): Node =
      body

  proc renderSlot(slot: SliderSlotRenderer): Node =
    if slot == nil:
      return nil
    slot()

  proc Slider*(
    checked: Signal[bool]
    onToggle: proc (next: bool) = nil;
    labelText: string = "Toggle option";
    leftSlot: SliderSlotRenderer = nil;
    rightSlot: SliderSlotRenderer = nil;
    colors: SliderColors = SliderColors()
  ): Node =
    let trackColor = if colors.track.len > 0: colors.track else: "var(--grey)"
    let thumbColor = if colors.thumb.len > 0: colors.thumb else: "var(--primary)"
    let thumbActive = if colors.thumbActive.len > 0: colors.thumbActive else: thumbColor

    SliderContainer:
      let leftNode = renderSlot(leftSlot)
      if not leftNode.isNil:
        SliderSlot:
          leftNode

      SliderLabel(
        ariaLabel = labelText,
        styleVars = styleVars("--slider-track-bg" = trackColor)
      ):
        SliderInput(
          `type`="checkbox",
          name="slider-input",
          checked = checked,
          ariaLabel = labelText,
        )
        SliderFill(
          class = "slider-fill",
          styleVars = styleVars(
            "--slider-thumb-color" = thumbColor,
            "--slider-thumb-color-active" = thumbActive
          )
        )

      let rightNode = renderSlot(rightSlot)
      if not rightNode.isNil:
        SliderSlot:
          rightNode
