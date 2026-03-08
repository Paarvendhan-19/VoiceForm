# Quick Deploy to AWS Amplify - 5 Minutes

## Step 1: Push to GitHub (1 min)
```bash
git push origin main
```

## Step 2: AWS Amplify Setup (3 min)

1. Go to: https://console.aws.amazon.com/amplify/
2. Click "New app" → "Host web app"
3. Connect GitHub → Select `VoiceForm` repo → Branch: `main`
4. Click "Next" → "Save and deploy"

That's it! Your app will be live in ~5 minutes.

## Your App URL
After deployment: `https://main.[app-id].amplifyapp.com`

## Future Updates
Just push to GitHub:
```bash
git add .
git commit -m "Update"
git push origin main
```
Auto-deploys in 2-3 minutes!

## Need Help?
See full guide: `AWS_AMPLIFY_DEPLOYMENT.md`
