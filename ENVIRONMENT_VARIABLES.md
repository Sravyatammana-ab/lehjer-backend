# Environment Variables for Render Deployment

## Required Environment Variables

### OPENAI_API_KEY
- **Description**: Your OpenAI API key for document analysis
- **Value**: Your actual OpenAI API key (e.g., `sk-...`)
- **How to get**: Visit https://platform.openai.com/api-keys
- **Required**: Yes (for AI features to work)

### ALLOWED_ORIGINS (Optional)
- **Description**: Comma-separated list of allowed frontend URLs
- **Value**: `https://your-frontend-domain.com,https://localhost:3000`
- **Default**: `*` (allows all origins)
- **Required**: No (but recommended for production)

## Optional Environment Variables

### PORT
- **Description**: Port number for the application
- **Value**: Usually set automatically by Render
- **Default**: `8000`
- **Required**: No

### HOST
- **Description**: Host address for the application
- **Value**: Usually `0.0.0.0` for Render
- **Default**: `0.0.0.0`
- **Required**: No

## Setting Environment Variables in Render

1. Go to your Render dashboard
2. Select your web service
3. Go to "Environment" tab
4. Add each environment variable:
   - Key: `OPENAI_API_KEY`
   - Value: `your-actual-openai-api-key`
5. Click "Save Changes"
6. Redeploy your service
