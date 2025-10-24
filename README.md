# Backend for Document AI (FastAPI)

## Setup

1. **Install dependencies:**

```bash
pip install -r requirements.txt
```

2. **Set your OpenAI API key:**

On Windows (PowerShell):
```powershell
$env:OPENAI_API_KEY="your-openai-api-key-here"
```
On Linux/macOS:
```bash
export OPENAI_API_KEY="your-openai-api-key-here"
```

3. **Run the server:**

```bash
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

## API Endpoint

- `POST /analyze-document/`  
  Upload a document (PDF, DOCX, TXT, CSV, XLS, XLSX) as form-data with key `file`. Returns a summary using OpenAI.

## Notes
- Ensure your OpenAI API key is valid and has access to the GPT-3.5-turbo model.
- The backend is CORS-enabled for local frontend development.
- Get your OpenAI API key from: https://platform.openai.com/api-keys 