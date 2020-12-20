# Robolyst landing site

site: http://robolyst.com

## Development setup

Install Vercel (formerlly Zeit) `npm i -g vercel`

Install Hugo `brew install hugo`

## Run the development site
```
hugo server --watch --buildDrafts
```

## Deployment

Run `vercel` to run an immutable deploy. You'll get a unique URL to the deploy.

Once happy, run `vercel --prod` to deploy behind http://economicallywoke.com