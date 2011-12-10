# Nanoc kickstart

A Nanoc site with *'batteries included'*.

## TL;DR (Installation)

**Get this**

`git clone git://github.com/netmute/nanoc_kickstart.git && cd nanoc_kickstart`

**Get bundler**

`gem install bundler`

**Get all needed gems**

`bundle`

**Smoke it!**

`nanoc compile`

## Overview

What's so great about this?!

### Bundler
Everything you need by just typing `bundle`.

### haml, sass & Compass
All configured and ready to go.

### Twitter Bootstrap
Will be automatically installed and loaded into Compass.

### Pow!
A pow-ready **config.ru**, which means you can just start this Nanoc site with your favorite development Rack server.

### Custom html entity helper
A custom version of the `h()` helper method, which will convert every special character into its matching html entity, not just the 4 provided by the standard method.

## Credits
I take some helpers from mgutz great nanoc3 blog example: https://github.com/mgutz/nanoc3_blog
