require 'minitest/autorun'
require_relative '../lib/changelly'

module Changelly
  class ClientTest < Minitest::Test
    def setup
      # Do nothing
    end

    def teardown
      # Do nothing
    end

    def test_get_currencies_full
      puts ENV['changelly_api_key']
      puts ENV['changelly_secret_key']
      client = Changelly::Client.new
      assert client.get_currencies_full
    end
  end
end