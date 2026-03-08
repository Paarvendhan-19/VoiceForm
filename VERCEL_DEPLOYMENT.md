# Vercel Deployment Guide for Flutter Web

## Issue: 404 NOT_FOUND

The 404 error happens because Vercel needs proper configuration for Flutter web apps.

## Solution: Two Options

### Option 1: Quick Fix - Redeploy with Settings

1. **Go to your Vercel project settings:**
   - Visit: https://vercel.com/dashboard
   - Select your VoiceForm project
   - Go to "Settings" → "General"

2. **Update Build & Output Settings:**
   - **Framework Preset:** Other
   - **Build Command:** `flutter build web --release --web-renderer html`
   - **Output Directory:** `build/web`
   - **Install Command:** Leave empty (we'll use vercel.json)

3. **Redeploy:**
   - Go to "Deployments" tab
   - Click "..." on latest deployment
   - Click "Redeploy"

### Option 2: Use vercel.json (Recommended)

The `vercel.json` file has been created with proper configuration.

**Push the changes:**
```bash
git add vercel.json VERCEL_DEPLOYMENT.md
git commit -m "Add Vercel configuration for Flutter web"
git push origin main
```

Vercel will auto-deploy with the new configuration.

## Important Notes

### Flutter on Vercel Limitations

Vercel has a 12-minute build timeout which might be tight for Flutter builds. If builds fail:

1. **Pre-build locally and commit:**
   ```bash
   flutter build web --release
   git add build/web
   git commit -m "Add pre-built web files"
   git push origin main
   ```

2. **Update vercel.json to skip build:**
   ```json
   {
     "buildCommand": "echo 'Using pre-built files'",
     "outputDirectory": "build/web"
   }
   ```

### Better Alternative: AWS Amplify

Vercel isn't optimized for Flutter. Consider AWS Amplify instead:
- Better Flutter support
- Longer build timeouts
- Free tier includes more resources
- See `AWS_AMPLIFY_DEPLOYMENT.md` for guide

## Troubleshooting

### Still Getting 404?

1. **Check Output Directory:**
   - Ensure `build/web` exists
   - Verify `index.html` is in `build/web/`

2. **Check Build Logs:**
   - Go to Vercel dashboard
   - Click on failed deployment
   - Check build logs for errors

3. **Manual Deploy:**
   - Install Vercel CLI: `npm i -g vercel`
   - Run: `vercel --prod`
   - Select `build/web` as output directory

### Build Timeout?

If Flutter build takes too long:
1. Build locally: `flutter build web --release`
2. Commit build folder: `git add build/web -f`
3. Push: `git push origin main`
4. Update vercel.json to skip build

## Quick Fix Commands

```bash
# Add Vercel config
git add vercel.json VERCEL_DEPLOYMENT.md

# Commit
git commit -m "Fix Vercel deployment configuration"

# Push (triggers auto-deploy)
git push origin main
```

Wait 2-3 minutes for Vercel to redeploy.

## Expected Result

After fixing, your app should load at:
```
https://voice-form-[your-project].vercel.app
```

## If Issues Persist

Switch to AWS Amplify (recommended for Flutter):
1. See `DEPLOY_NOW.md` for step-by-step guide
2. AWS Amplify has better Flutter support
3. Longer build timeouts
4. More reliable for Flutter web apps
