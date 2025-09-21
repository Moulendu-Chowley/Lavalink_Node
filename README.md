# Lavalink Server for Railway

This is a Lavalink server configured for deployment on Railway.

## Files

- `Lavalink.jar` - The Lavalink server JAR file
- `application.yml` - Configuration file with environment variables
- `Dockerfile` - Docker configuration for Railway deployment
- `railway.toml` - Railway-specific deployment configuration
- `plugins/` - Directory containing Lavalink plugins

## Railway Deployment

### 1. Deploy to Railway

1. Push this repository to GitHub
2. Connect your GitHub repository to Railway
3. Railway will automatically detect the Dockerfile and deploy

### 2. Required Environment Variables

Set these environment variables in your Railway project dashboard:

**Required:**

- `LAVALINK_PASSWORD` - Password for connecting to Lavalink

**YouTube Plugin (if enabled):**

- `YOUTUBE_REFRESH_TOKEN` - OAuth refresh token for YouTube

**Spotify (if enabled):**

- `SPOTIFY_CLIENT_ID` - Spotify client ID
- `SPOTIFY_CLIENT_SECRET` - Spotify client secret
- `SPOTIFY_SP_DC` - Spotify spDc cookie
- `SPOTIFY_CUSTOM_TOKEN_ENDPOINT` - Custom token endpoint
- `SPOTIFY_COUNTRY_CODE` - Country code (e.g., US)

**Other Services (optional):**

- Set environment variables for other music services as needed
- Check `application.yml` for all available environment variables

### 3. Connection

Once deployed, you can connect to your Lavalink server using:

- **Host:** Your Railway app URL
- **Port:** 443 (Railway uses HTTPS)
- **Password:** The value you set for `LAVALINK_PASSWORD`
- **SSL:** True (Railway provides HTTPS)

## Local Development

To run locally with Docker:

```bash
# Build the image
docker build -t lavalink .

# Run with environment variables
docker run -e PORT=2333 -e LAVALINK_PASSWORD=yourpassword -p 2333:2333 lavalink
```

## Notes

- Railway automatically provides the `PORT` environment variable
- The server is configured to bind to `0.0.0.0` for Railway compatibility
- Health check endpoint is available at `/version`
- Logs are stored in the `logs/` directory within the container
