type
  IntersectionObserver* = ref object

  IntersectionObserverEntry* = ref object

  IntersectionObserverCallback* = proc(entries: seq[IntersectionObserverEntry])

  DomNode* = ref object
