when defined(js):
  import ../ntml

  let globalStyles*: Node =
    style:
      """
        :root {
          background: #020617;
          color: #e2e8f0;
          font-family: 'Inter', system-ui, sans-serif;
        }
      """
