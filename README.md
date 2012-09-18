Fork project
============


```
git clone git://github.com/iboard/a64.git
cd a64
bundle
rails server
```

Deploy to your server
=====================

Requirements
------------

  * Debian/Ubuntu server
  * Apache with proxy and proxy-balancer

Prepare
-------

  1. Create file `config/servers/your.server.com.rb
  2. Create directory `config/servers/config/your.server.com   [1]

Deploy
------

**Initial deploy**

    cap TARGET=your.server.com deploy:setup
    cap TARGET=your.server.com deploy:cold
    cap TARGET=your.server.com webrick:start

**After update code**

    git commit -am "Your change notes"
    git push
    cap TARGET=your.server.com deploy

Live Demo
=========

  * http://a64.iboard.cc


1: