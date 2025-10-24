# Lehjer Backend Deployment Guide for Render

## Prerequisites

1. **GitHub Account**: Your code needs to be in a GitHub repository
2. **Render Account**: Sign up at https://render.com
3. **OpenAI API Key**: Get from https://platform.openai.com/api-keys

## Step 1: Prepare Your Repository

### Option A: Separate Backend Repository (Recommended)
1. Create a new GitHub repository for your backend
2. Copy only the backend folder contents to the new repository
3. Push to GitHub

### Option B: Use Existing Repository
1. Keep your current repository structure
2. Render will automatically detect the backend folder

## Step 2: Deploy to Render

### Method 1: Using Render Dashboard (Recommended)

1. **Login to Render**
   - Go to https://render.com
   - Sign in with your GitHub account

2. **Create New Web Service**
   - Click "New +" → "Web Service"
   - Connect your GitHub repository
   - Select your backend repository (or the repository containing backend folder)

3. **Configure Service Settings**
   ```
   Name: lehjer-backend
   Environment: Python 3
   Region: Choose closest to your users
   Branch: main (or your default branch)
   Root Directory: backend (if using Option B)
   Build Command: pip install -r requirements.txt
   Start Command: uvicorn main:app --host 0.0.0.0 --port $PORT
   ```

4. **Set Environment Variables**
   - Go to "Environment" tab
   - Add the following variables:
     ```
     OPENAI_API_KEY = your-openai-api-key-here
     ALLOWED_ORIGINS = https://your-frontend-domain.com (optional)
     ```

5. **Deploy**
   - Click "Create Web Service"
   - Wait for deployment to complete (5-10 minutes)

### Method 2: Using render.yaml (Alternative)

If you prefer configuration files:
1. The `render.yaml` file is already created in your backend folder
2. Use "New +" → "Blueprint" instead of "Web Service"
3. Select your repository
4. Render will automatically use the render.yaml configuration

## Step 3: Verify Deployment

1. **Check Health Endpoint**
   - Visit: `https://your-service-name.onrender.com/health`
   - Should return: `{"status": "healthy", "openai_configured": true}`

2. **Test API Endpoint**
   - Visit: `https://your-service-name.onrender.com/`
   - Should return: `{"message": "Lehjer Document AI API is running", "status": "healthy"}`

## Step 4: Update Frontend Configuration

Once your backend is deployed, update your frontend to use the new API URL:

1. **Find your backend URL**
   - It will be: `https://your-service-name.onrender.com`

2. **Update frontend API calls**
   - Replace localhost URLs with your Render URL
   - Example: `http://localhost:8000` → `https://your-service-name.onrender.com`

## Troubleshooting

### Common Issues

1. **Build Fails**
   - Check that all dependencies are in requirements.txt
   - Ensure Python version compatibility

2. **Service Won't Start**
   - Verify start command: `uvicorn main:app --host 0.0.0.0 --port $PORT`
   - Check logs in Render dashboard

3. **Environment Variables Not Working**
   - Ensure variables are set in Render dashboard
   - Check variable names match exactly (case-sensitive)

4. **CORS Errors**
   - Set ALLOWED_ORIGINS environment variable
   - Include your frontend domain

### Checking Logs

1. Go to your service in Render dashboard
2. Click "Logs" tab
3. Look for error messages or warnings

## Free Tier Limitations

- **Sleep Mode**: Service sleeps after 15 minutes of inactivity
- **Cold Start**: First request after sleep takes ~30 seconds
- **Build Time**: 90 minutes per month
- **Bandwidth**: 100GB per month

## Production Considerations

1. **Upgrade Plan**: Consider paid plan for production use
2. **Custom Domain**: Add custom domain for professional appearance
3. **SSL**: HTTPS is automatically provided
4. **Monitoring**: Use Render's built-in monitoring tools

## Next Steps

1. Deploy your frontend (separate guide)
2. Configure frontend to use backend API URL
3. Test end-to-end functionality
4. Set up monitoring and alerts

## Support

- Render Documentation: https://render.com/docs
- Render Community: https://community.render.com
- OpenAI API Documentation: https://platform.openai.com/docs
