<p align="center"><img src="https://economicallywoke.com/img/logo-wide.svg" /></p>

<h3 align="center">Become a better investor by understanding money and economics with data.</h3>

<p align="center"><a href="http://econoimcallywoke.com">EconomicallyWoke.com</a></p>

<p align="center"><img src="https://economicallywoke.com/img/site-preview.gif" /></p>

# Repo structure

Top level structure contains three folders:
```
economicallywoke/
├── design/
├── research/
├── website/
```

* `design` - contains any artifacts and resources used to create the design on the website. 
* `research` - contains the jupyter notebooks used to perform the mathematical and data research behind the chapters.
* `webiste` - contains the website. Created with [Hugo](https://gohugo.io/).

### Content
All the chapters are inside the [website/content directory](https://github.com/robolyst/economicallywoke/tree/master/website/content).

# Development
## Development setup

Install Hugo:
```bash
brew install hugo
```
Run the deveopment site
```bash
hugo server --watch --buildDrafts
```

## Deployment

### Option 1: Manual deployment

Install Vercel (formerlly Zeit) `npm i -g vercel`

Run `vercel` to run an immutable deploy. You'll get a unique URL to the deploy.

Once happy, run `vercel --prod` to deploy behind http://economicallywoke.com

### Option 2: CI

Anything on the master branch is automatically deployed to production.