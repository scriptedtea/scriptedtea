---
title: Flutter and the Mobile World
date: 2019-10-26
author: Lily Guo
categories: [tech]
tags: [flutter, android, ios, dart, mobile]
header:
  teaser: /assets/images/posts/flutter_logo.png
excerpt_separator: <!--more-->
---
<div class="archive__item-teaser">
    <img src="{{ site.url }}{{ site.baseurl }}/assets/images/posts/flutter_logo.png" alt="">
</div>

<p></p>

I've always been wanting to try doing mobile, but never got a chance to work on it until now. One of the reasons why I bought a Macbook back in 2013 was just so I could do iOS development, but I somehow never got around to do that. Other than not having time or being lazy, there were other things such as deciding whether to make an Android or iOS app. Each had its pros and cons. At the time, I was leaning more towards iOS development as I didn't own an Android phone then, but having to learn a brand new language (Objective-C) and the entire Apple ecosystem created an uphill battle for me, which made it difficult to get started.

With Flutter, I don't need to be locked onto a specific platform. Flutter is [Google's new cross-platform mobile framework](https://flutter.dev/). It lets you write a single codebase, written in a language called Dart, and Flutter will help you build both native Android and iOS versions for you. During development you can choose to use either Android or iOS devices, which makes it easy for collaboration (eg. Non-Mac users can also contribute to an iOS app, provided at least one person has a Mac to build and release the app). Flutter also provides a set of UI libraries that automatically conforms to the respective platform's layout, so there's no need to know about the respective platform's native library and how they work. In addition, as it is backed by Google, the documentations are very detailed and easy to follow, as I was able to run a demo app within half an hour from reading the setup guide. 

After months of learning and developing, I am proud to share that me and a friend have built our first app and released it in August on Android and iOS, which had a total of over 2,500 downloads! I will talk more about the app in a future post. They say that the best way to learn is through hands-on experience, and through the making of the app, I can say that the experience has been very positive. The only downside is that as Flutter is still relatively new (Version 1.0 was only launched near end of 2018), there are still some lack of support on integrating with basic mobile capabilities (for example, there's still lack of support for accessing and playing music from your iOS library). The good news is that lately Flutter has been gaining a lot of traction from the dev community, so I'm optimistic that things will improve fairly quickly. It's safe to say that the app is certainly not my last, and I hope to do a deeper dive into the world of Flutter for my next app. 
