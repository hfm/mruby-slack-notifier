module Slack
  class Notifier
    attr_reader :endpoint, :default_payload

    def initialize(webhook_url, options = {})
      @endpoint = webhook_url
      @default_payload = options
    end

    def ping(message, options = {})
      payload = default_payload.merge(options)
      payload.merge!(text: message)
      params = { payload: payload.to_json }

      client.post endpoint, params, { 'Content-Type' => 'application/x-www-form-urlencoded'}
    end

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
  end
end
