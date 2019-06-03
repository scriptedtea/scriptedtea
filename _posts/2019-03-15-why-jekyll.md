---
title: Why I Chose Jekyll to Build My Website
date: 2019-03-15
categories: [tech]
tags: [jekyll, github pages, web development]
header:
  teaser: /assets/images/posts/jekyll_logo.png
excerpt: "I've been wanting to create my own website for a long time, but never really committed to making one until recently. Since I had no former experience with web development, I had to start from the very beginning - from researching which stack to use all the way to web hosting and deployment. I wanted to make sure that I chose the right tools that suit my needs, and after a bit of research I ended up going with [Jekyll](https://jekyllrb.com/). Here is why."
---

<img src="{{ site.url }}{{ site.baseurl }}/assets/images/posts/jekyll_logo.png" alt="">

I've been wanting to create my own website for a long time, but never really committed to making one until recently. Since I had no former experience with web development, I had to start from the very beginning - from researching which stack to use all the way to web hosting and deployment. I wanted to make sure that I chose the right tools that suit my needs, and after a bit of research I ended up going with [Jekyll](https://jekyllrb.com/). Here is why.

My criteria for a website was simple: it should be 1) relatively quick to build and 2) gives me full customization capability. I've used various CMS in the past such as weebly/blogspot/wix, but I've found that those aren't as flexible in customization as compared to building my own website. I also had to decide whether it would be a static website or a dynamic one as each would have very different tech stacks. Because my site would mainly be used for blogging and occasionally photo sharing, a static website would be more suitable as it is more light-weight than a dynamic one. It's also worth to note that I did not need something that is only available in a dynamic website, such as a database or a login page. Then it came down to choosing a static site generator, since writing everything in raw HTML isn't the most exciting thing, and managing all the asset files would be a pain. Initially, I heard about Jekyll through a friend of mine when he showed me his website that he was working on at the time. I decided to install it and play around with it, and found the setup extremely simple and well-documented. Another factor was that Jekyll is fully supported by Github Pages, which provides free web hosting provided that the repository is public, so overall it was an easy sell for me. (Although using Github Pages came with its own challenges, more on that in a later post) Jekyll offered a suite of themes that you could use to get started, and so after a bit of browsing I decided to use [Minimal Mistakes](https://github.com/mmistakes/minimal-mistakes), which had pretty much everything I needed with a bit of customization. I highly recommend it if you are looking for a template to get started.

After using Jekyll to build my static website, I have to say that I'm glad I went with it because it provides the best of both worlds in that it allows me to fully design my website in HTML/CSS/JS but on the other hand enables me to write minimal amount of code when I write a blog post (blog post has full markdown support and lets me inject raw HTML code if I find the need to do that). Not needing to code meant that I can focus more on the content of my posts, but also gives me the flexibility to make the post more visually appealing if I find the need to.

I will be posting more about Jekyll, so stay tuned!