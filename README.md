# mruby-slack-notifier [![Build Status](https://travis-ci.org/hfm/mruby-slack-notifier.svg?branch=master)](https://travis-ci.org/hfm/mruby-slack-notifier)

A wrapper to notify to [Slack](https://slack.com) webhooks. This project is a port of [slack-notifier](https://github.com/stevenosloan/slack-notifier) to [mruby](https://github.com/mruby/mruby).

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
slack = Slack::Notifier.new 'webhook_url'
slack.notify 'hello'
```

## License
under the MIT License:
- see [LICENSE](./LICENSE) file
