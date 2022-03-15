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
      client = Changelly::Client.new
      assert client.get_currencies_full
    end
  end
end