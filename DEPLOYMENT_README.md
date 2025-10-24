# Lehjer Backend - Deployment Ready

## Environment Variables Required

### Required Variables:
- `OPENAI_API_KEY`: Your OpenAI API key for document analysis

### Optional Variables:
- `ALLOWED_ORIGINS`: Comma-separated list of allowed frontend URLs (default: "*")

## Deployment Configuration

- **Python Version**: 3.11.0 (specified in runtime.txt and render.yaml)
- **Build Command**: `pip install -r requirements.txt`
- **Start Command**: `gunicorn main:app -w 1 -k uvicorn.workers.UvicornWorker --bind 0.0.0.0:$PORT`

## Dependencies

All dependencies are pinned to stable versions compatible with Python 3.11:
- FastAPI 0.104.1
- Uvicorn 0.24.0
- OpenAI 1.3.0
- Pandas 2.0.3 (stable version)
- And other required packages

## Health Check Endpoints

- `GET /` - Basic health check
- `GET /health` - Detailed health status with OpenAI configuration check
