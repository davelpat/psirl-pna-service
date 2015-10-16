require_relative "base_test_object"
require "minitest/autorun"

class TestBaseTestObject < Minitest::Test

  def test_string_keys
    assert_equal('is a string', BaseTestObject.new({'str_key' => 'is a string'}).str_key)
  end
end
