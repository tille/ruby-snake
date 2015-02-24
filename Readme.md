[![Dependency Status](https://gemnasium.com/tille/ruby-snake.svg)](https://gemnasium.com/tille/ruby-snake)

Ruby Snake
==========

Snake is an open source 2D game that was created with Ruby using [Gosu](http://www.libgosu.org/)

## Setup
To install all the dependencies, run:

```
bundle install
```
<blockquote>
Be sure of use the right ruby-version specified in .ruby-version before run bundler
If `Gosu` complains during the setup follow its page and install its dependencies for both C++ and Ruby.
</blockquote>

Dependencies: [Linux](https://github.com/jlnr/gosu/wiki/Getting-Started-on-Linux/) / 
[OS-X](https://github.com/jlnr/gosu/wiki/Getting-Started-on-OS-X/)

Next using foreman we can boot the application.

```
$ foreman start
```

Run tests typing: ``rspec``
