---
title: How to Build a Static Jekyll Site with Github Pages
date: 2019-06-02
author: Lily Guo
categories: [tech]
tags: [jekyll, github pages, web development]
header:
  teaser: /assets/images/posts/jekyll_pages.jpg
excerpt: "One of the great things about Jekyll is that it has close integration with Github Pages, which means you can let Github host and publish your website with just a few config changes. There are a lot of guides (for example, the [official Github documentation](https://help.github.com/en/articles/setting-up-your-github-pages-site-locally-with-jekyll)) that talk about how to set it up, so I won't go over it here."
---
<div class="archive__item-teaser">
    <img src="{{ site.url }}{{ site.baseurl }}/assets/images/posts/jekyll_pages.jpg" alt="">
    <span class="archive__item-caption">{{ "Image Credit to Lars Veelaert" | markdownify | remove: "<p>" | remove: "</p>" }}</span>
</div>

<p></p>

One of the great things about Jekyll is that it has close integration with Github Pages, which means you can let Github host and publish your website with just a few config changes. There are a lot of guides (for example, the [official Github documentation](https://help.github.com/en/articles/setting-up-your-github-pages-site-locally-with-jekyll)) that talk about how to set it up, so I won't go over it here. Within a few minutes, I was able to get my site up and running, and I was amazed at how easy it was to do that, but later on I ran into some issues that caused me to change my entire setup completely. 

The way that is works is that you push all your code into the master branch, and then you create (or let Github create) another branch called `gh-pages`. Github will automatically render the page based on the source that resides on that branch. Therefore my workflow before consisted of the following:

1. Make changes on `master` branch, commit/push to remote
2. Switch to `gh-pages` branch, merge changes from master to branch, commit/push to remote `gh-pages` branch
3. Github will automatically render what's on `gh-pages`

The biggest problem with this is that Github Pages does not support custom Jekyll plugins. I was troubleshooting with another issue where the solution required using a custom component, and that's when I realized that the current set up is a deal breaker for me. I decided to find out a different way of deploying my website while still using Github Pages. After some googling, I found that it's possible to deploy only the static pages (all the content in `_site` folder), which contain the files post rendering by Jekyll. This required doing some Git trickery, and after consulting with various solutions, this is what has worked for me.

**Make gh-pages only contain the generated HTML files**

This is what the new setup would look like.

1. `master` branch would only contain the source files (`_site` folder is ignored)
2. `gh-pages` branch would only contain what's in `_site` folder, and has no knowledge of files outside of it (and from its view, the content of `_site` folder is the root)

But by default in Git, you cannot have two branches that point to a different root. I've considered doing something with Git submodules but the downside to that is that master branch would end up keeping track of all the files in `_site` folder, which means I end up duplicating the `_site` content, which is not ideal.

**Solution is to put another git repo inside the _site folder**

The current git repo would continue pointing to the master branch as before (with `_site` folder ignored), and then the 2nd git repo would be created inside the `_site` folder so it would have no knowledge of what's outside of that folder. The 2nd repo would be pointing to the `gh-pages` branch so it would not conflict with the master branch.

Here are the git commands to help you get set up:

```
// First push all source files to origin master
$ git init
$ git add .
$ git remote add origin ssh://git@github.com:username/project.git
$ git push origin master
```

Now gitignore the `_site` folder

```
$ echo "_site" > .gitignore
$ git add .
$ git commit -m "adding gitignore"
$ git push origin master
```

Now clone the 2nd repo, delete the master branch in the new repo:
```
$ cd _site
// Make sure this directory is empty via
$ rm -r
$ git clone ssh://git@github.com:username/project.git .
$ git checkout origin/gh-pages -b gh-pages
// Delete the master branch
$ git branch -d master
// Now locally delete all the files
$ rm -r
```
Build the Jekyll site locally to generate the HTMl files, then push
```
$ cd ..
$ bundle exec jekyll build
$ cd _site
$ git add .
$ git commit -m "Deploying build"
$ git push origin gh-pages
```
In the project root repo, make sure there is no `gh-pages` branch, and you're all set!

Make sure that you put an empty file called `.nojekyll` file in the project root folder, so then Jekyll will put that file in `_site` folder, and Github Pages will not try to render what's in `_site` folder as a Jekyll site. It will just display a static site instead.

Now this is the new workflow using the new set up. Follow the steps below once you are finished making changes in your source and you want to deploy the new site to Github Pages.

1. Run `bundle exec jekyll build` in project root folder
2. Run `cd _site`
3. Run `git add .`
4. Run `git commit -m "Commit Message Here"`
5. Run `git push origin gh-pages`

Here is a simple bash script called `deploy.sh` that will do all the above commands (except for the build command) for you:

```
#!/usr/bin/env bash

if [[ -z "$1" ]]; then
  echo "Please enter a git commit message"
  exit
fi

cd _site && \
git add . && \
git commit -m "$1" && \
git push origin gh-pages && \
cd .. && \
echo "Successfully built and pushed gh-pages to Github."
```

Make sure you give permission for the script to run:
`chmod +x deploy.sh`

To run, just type this:
`$ ./deploy.sh "Your Commit Message Here"`

And that's it! I got the best of both worlds where I get to keep track the source and the generated files on separate branches (thus avoided having to keep track of duplicate files), and I got to be able to use custom Jekyll plugins!








