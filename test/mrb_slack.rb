##
## Slack::Notifier Test
##

assert("Slack::Notifier#new") do
  slack = Slack::Notifier.new 'http://example.com'
  assert_equal 'http://example.com', slack.endpoint

  slack = Slack::Notifier.new 'http://example.com', channel: '#all'
  assert_equal '#all', slack.channel
  assert_true slack.default_payload.key?(:channel)

  slack = Slack::Notifier.new 'http://example.com', username: 'example'
  assert_equal 'example', slack.username
  assert_true slack.default_payload.key?(:username)

  slack = Slack::Notifier.new 'http://example.com', channel: '#all', username: 'example'
  assert_equal '#all', slack.channel
  assert_equal 'example', slack.username
  assert_true slack.default_payload.key?(:channel)
  assert_true slack.default_payload.key?(:username)
end
