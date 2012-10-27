PROJECT A64 README
==================

A clean and 100% test-covered Rails-application you may fork and use as a starter-app for you own project(s).

  * [At Github](http://github.com/iboard/a64)
  * [Live demo](http://a64.iboard.cc)
  * [Coverage](http://a64.iboard.cc/coverage/index.html)


Fork project
============

    git clone git://github.com/iboard/a64.git
    cd a64
    bundle

Test
====

**Start spork**

    bundle exec spork

**Runs specs**

    rspec --drb spec/spec_helper.rb spec/**/*_spec.rb

**Test and create coverage files**

    rspec --no-drb spec/spec_helper.rb spec/**/*_spec.rb
    open coverage/index.html

_open command_ [(1)](#fn1)

See [current coverage-document](http://a64.iboard.cc/coverage/index.html)

Deploy to your server
=====================

Requirements
------------

  * Debian/Ubuntu server
  * Apache with proxy and proxy-balancer

Prepare
-------

  1. Create file `config/servers/your.server.com.rb
  2. Create directory `config/servers/config/your.server.com   [(2)](#fn2)

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


Documentation, YARD
===================

    yard
    open doc/index.html

Engines
=======

  * [Admin](https://github.com/iboard/a64admin)
  * _User --development not started yet--_

Live Demo
=========

> [http://a64.iboard.cc](http://a64.iboard.cc)

---------------------------

Contact
=======

**[Andreas Atendorfer](http://about.me/andreas.altendorfer)**<br/>
4053 Haid, Austria

Please read and use [Github issues](https://github.com/iboard/a64/issues) before sending an e-mail.

License
=======

### This is a **"Free Project"**

Use it as is and do whatever you want.
No warranty, No support (expect [Github-issues](https://github.com/iboard/a64/issues))
Keeping (c) remarks and don't hiding the origin is appreciated, tho.


Footnotes
=========

**<a name='fn1'>1)</a>**
  the 'open-command' is available on MacOS and opens the file with your default-browser

**<a name='fn2'>2)</a>**
  Details about server-configuration-files will follow here.