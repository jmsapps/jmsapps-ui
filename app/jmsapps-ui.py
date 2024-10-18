from dotenv import load_dotenv as loadEnv
from weasyprint import HTML
import os


if __name__ == "__main__":
    loadEnv()

    BASE_FILEPATH = os.getenv("BASE_FILEPATH")
    RESUME_FILENAME = os.getenv("RESUME_FILENAME")
    PDF_FILENAME = os.getenv("PDF_FILENAME")

    resumeFile = f'{BASE_FILEPATH}/{RESUME_FILENAME}'
    pdfFile = f'{BASE_FILEPATH}/{PDF_FILENAME}'

    try:
        HTML(resumeFile).write_pdf(pdfFile)
    except Exception as e:
        print(f"script failed because '{e}'")
        exit()

    print(f"successfully exported pdf to '{pdfFile}'")
