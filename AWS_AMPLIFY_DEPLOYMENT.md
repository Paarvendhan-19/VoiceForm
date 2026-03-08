# AWS Amplify Deployment Guide for VoiceForm

## Prerequisites
- AWS Account (create one at https://aws.amazon.com if you don't have it)
- GitHub/GitLab/Bitbucket account with this repository pushed
- Flutter SDK installed (already done ✓)

## Step 1: Push Your Code to GitHub

```bash
# Add all changes
git add .

# Commit changes
git commit -m "Add AWS Amplify configuration"

# Push to GitHub (if not already done)
git push origin main
```

## Step 2: Set Up AWS Amplify

1. **Go to AWS Amplify Console**
   - Visit: https://console.aws.amazon.com/amplify/
   - Sign in to your AWS account

2. **Create New App**
   - Click "New app" → "Host web app"
   - Choose your Git provider (GitHub/GitLab/Bitbucket)
   - Authorize AWS Amplify to access your repository

3. **Select Repository**
   - Choose your repository: `VoiceForm`
   - Select branch: `main`
   - Click "Next"

4. **Configure Build Settings**
   - App name: `vani-sahayak` or `voiceform`
   - The `amplify.yml` file will be automatically detected
   - Click "Next"

5. **Review and Deploy**
   - Review all settings
   - Click "Save and deploy"

## Step 3: Build Configuration (Already Done)

The `amplify.yml` file in your project root contains:
- Flutter installation
- Dependency installation
- Web build commands
- Output directory configuration

## Step 4: Environment Variables (If Needed)

If your app uses Firebase or other services, add environment variables:

1. In Amplify Console, go to your app
2. Click "Environment variables" in the left menu
3. Add any required variables:
   - `FIREBASE_API_KEY`
   - `FIREBASE_PROJECT_ID`
   - etc.

## Step 5: Custom Domain (Optional)

1. In Amplify Console, go to "Domain management"
2. Click "Add domain"
3. Follow the instructions to:
   - Add your custom domain
   - Configure DNS settings
   - Get free SSL certificate

## Deployment Process

Once configured, AWS Amplify will:
1. ✓ Automatically detect code changes when you push to GitHub
2. ✓ Build your Flutter web app
3. ✓ Deploy to global CDN
4. ✓ Provide a URL like: `https://main.xxxxx.amplifyapp.com`

## Continuous Deployment

Every time you push to your main branch:
```bash
git add .
git commit -m "Your changes"
git push origin main
```

AWS Amplify will automatically rebuild and redeploy your app!

## Monitoring

- View build logs in Amplify Console
- Monitor app performance
- Check deployment history
- View access logs

## Cost Estimate

AWS Amplify Free Tier includes:
- 1,000 build minutes per month
- 15 GB served per month
- 5 GB stored per month

After free tier: ~$0.01 per build minute, $0.15/GB served

## Troubleshooting

### Build Fails
- Check build logs in Amplify Console
- Verify `amplify.yml` configuration
- Ensure all dependencies are in `pubspec.yaml`

### Firebase Not Working
- Add Firebase config as environment variables
- Update `firebase_options.dart` to use environment variables
- Ensure Firebase web app is configured

### Performance Issues
- Enable caching in `amplify.yml` (already configured)
- Use CloudFront CDN (automatic with Amplify)
- Optimize images and assets

## Next Steps

1. Push code to GitHub
2. Set up AWS Amplify (follow steps above)
3. Configure custom domain (optional)
4. Set up monitoring and alerts
5. Share your app URL!

## Support

- AWS Amplify Docs: https://docs.aws.amazon.com/amplify/
- Flutter Web Docs: https://docs.flutter.dev/platform-integration/web
- Firebase Web Setup: https://firebase.google.com/docs/web/setup

---

Your app will be live at: `https://main.[your-app-id].amplifyapp.com`
