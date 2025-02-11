# JMS Apps

This repository is for my personal business website, but I also have a LaTeX-based PDF generator that you can use.

## How It Works

This project includes a LaTeX template (`app/resume/jakes-template.tex`) that can generate a professional PDF resume. It uses **pdflatex** or **latexmk** to compile the `.tex` file into a `.pdf`.

These instructions are for **macOS**, but the required software is also available for **Windows** and **Linux**.

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/jmsapps/jmsapps-ui.git
   cd jmsapps-ui
   ```

2. **Ensure LaTeX is Installed**

   **macOS:**
   Install **MacTeX** from [tug.org/mactex](https://tug.org/mactex/). Then, ensure it’s in your system’s PATH:
   ```bash
   export PATH="/Library/TeX/texbin:$PATH"
   ```
   Verify installation by running:
   ```bash
   pdflatex --version
   latexmk -v
   ```
   Restart VSCode if necessary.

   **Windows:**
   Install **MiKTeX** from [miktex.org/download](https://miktex.org/download), then use the `pdflatex.exe` and `latexmk.exe` commands from the MiKTeX console or command prompt.

   **Linux:**
   Install **TeX Live**:
   ```bash
   sudo apt install texlive-full   # Debian/Ubuntu
   sudo dnf install texlive        # Fedora
   sudo pacman -S texlive-most     # Arch
   ```
   Verify installation:
   ```bash
   pdflatex --version
   latexmk -v
   ```

## Usage

### **Generating a PDF Resume**
To compile the LaTeX file and generate a PDF:

```bash
pdflatex -output-directory=app/resume app/resume/jakes-template.tex
```

Alternatively, use `latexmk` for automatic dependency handling:

```bash
latexmk -pdf -output-directory=app/resume app/resume/jakes-template.tex
```

### **Cleaning Up Auxiliary Files**
To remove extra files like `.aux`, `.log`, and `.out` after compilation:

```bash
latexmk -c -output-directory=app/resume
```

## Customization

Edit `app/resume/jakes-template.tex` to modify the resume content. You can customize:
- **Your name and contact info**
- **Education, experience, and projects**
- **Skills and technical details**

## Contributions

Feel free to fork this repo and modify it to fit your needs. You can use this as a base for your own resume generation system.
Please also note that I have only run this on Mac, so if you have improvements for the Linux or Windows instructions, please contribute.

## License

This project is fully open-source, and you are free to use it for personal or commercial purposes.
