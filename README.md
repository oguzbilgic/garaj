Garaj
=====

a tiny web app which lets you browse your project`s source code
locally using a web browser.

![garaj-v0.0.1](http://i.imgur.com/6gVvQ.png)

## Installation

Add this line to your application's Gemfile:

    group :development 
      gem 'garaj'
    end

Or install to your system:

    $ gem install garaj

## Usage

Go to your project's folder and start garaj:

    $ cd my-awesome-app/
    $ garaj

Visit your garaj using a web browser at:

http://127.0.0.1:9988

## Roadmap

* Syntax highlighting
* File, page icons
* Readme.md support
* Markdown support
* Support non-text file types
* Running as deamon (garaj -d)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
