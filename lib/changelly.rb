# frozen_string_literal: true

require_relative "changelly/version"
require "faraday"


module Changelly
  class Error < StandardError; end
  class Client
    def initialize(api_key=ENV['changelly_api_key'],api_secret=ENV['changelly_secret_key'])
      @api_key = api_key
      @key = api_secret
      @connection = Faraday.new('https://api.changelly.com') do |conn|
        conn.request :json
        conn.response :json
      end
    end
    def http_params(message)
      @hmac = OpenSSL::HMAC.hexdigest("SHA512", @key.encode('utf-8'), message.to_json.encode('utf-8').to_s)
      {'api-key':@api_key,'sign':@hmac}
    end
    def get_currencies_full
      @@message = {
                    "id": "test",
                    "jsonrpc": "2.0",
                    "method": "getCurrenciesFull",
                    "params": []
                  }
      response = @connection.post('',body:@@message,params:http_params(@@message))
      puts response.body.to_s
      return response
    end
  end
end
