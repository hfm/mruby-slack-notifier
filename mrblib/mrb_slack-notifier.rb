module Slack
  class Notifier
    attr_reader :endpoint, :default_payload

    def initialize(webhook_url, options = {})
      @endpoint = webhook_url
      @default_payload = options
    end

    def notify(message, options = {})
      payload = default_payload.merge(options)
      payload.merge!(text: format(message))
      params = { payload: payload.to_json }

      client.post endpoint, params, { 'Content-Type' => 'application/x-www-form-urlencoded'}
    end

    # compatibility for https://github.com/stevenosloan/slack-notifier
    alias ping notify

    def channel
      default_payload[:channel]
    end

    def channel=(channel)
      default_payload[:channel] = channel
    end

    def username
      default_payload[:username]
    end

    def username=(username)
      default_payload[:username] = username
    end

    def client
      @client ||= HttpRequest.new
    end

    HTML_LINK_REGEX = /<a(?:.*?)href=['"](?<link>.+?)['"](?:.*?)>(?<text>.+?)<\/a>/
    MARKDOWN_LINK_REGEX = /\[(?<text>[^\]]+)\]\((?<link>[^)]+)\)/

    def format(message)
      message.gsub HTML_LINK_REGEX do |match|
        link = Regexp.last_match[:link]
        text = Regexp.last_match[:text]
        "<#{link}|#{text}>"
      end.gsub MARKDOWN_LINK_REGEX do |match|
        link = Regexp.last_match[:link]
        text = Regexp.last_match[:text]
        "<#{link}|#{text}>"
      end
    end
  end
end
