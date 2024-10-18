# Resume to PDF Generator

This simple Python script generates a PDF from an HTML resume using WeasyPrint. The goal of this tool is to provide an easy way to store and manage resumes while the full website is being developed. It can also be used as a template for anyone looking to build their own resume generation system.

## How It Works

1. The script loads environment variables for file paths using `dotenv`.
2. It takes an HTML file representing your resume and converts it into a PDF using WeasyPrint.
3. The final PDF file is stored in the specified directory.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/jmsapps/jmsapps-ui.git
   cd jmsapps-ui

   ```
2. Install the dependencies:

   ```bash
   pip install -r requirements.txt
   ```
3. Set up your `.env` file with the following environment variables:

   ```
   BASE_FILEPATH=<path_to_your_files>
   RESUME_FILENAME=<your_resume_html_filename>
   PDF_FILENAME=<output_pdf_filename>
   ```

## Usage

1. Place your HTML resume in the specified `BASE_FILEPATH`.
2. Run the script:
   ```bash
   python app/jmsapps-ui.py
   ```
3. The generated PDF will be saved at the same `BASE_FILEPATH` with the filename you specified.

## Customization

You can use the HTML template of the resume in this project as a base and customize it to fit your own style or needs. This makes it flexible for anyone looking to develop their own resume builder.

## Contributions

Feel free to contribute to use it as a foundation to create your own resume generation system.

## License

This project is fully open-source, and you are free to use it for personal or commercial purposes.
