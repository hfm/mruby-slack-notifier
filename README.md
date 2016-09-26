# mruby-slack-notifier   [![Build Status](https://travis-ci.org/hfm/mruby-slack-notifier.svg?branch=master)](https://travis-ci.org/hfm/mruby-slack-notifier)
Slack class
## install by mrbgems
- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :github => 'hfm/mruby-slack-notifier'
end
```
## example
```ruby
p Slack.hi
#=> "hi!!"
t = Slack.new "hello"
p t.hello
#=> "hello"
p t.bye
#=> "hello bye"
```

## License
under the MIT License:
- see LICENSE file
