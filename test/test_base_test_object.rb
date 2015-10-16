require 'minitest/autorun'
require_relative '../features/support/env'
require_relative '../features/support/base_test_object'

class TestBaseTestObject < Minitest::Test

  def setup
    @str_keys = BaseTestObject.new({'key1' => 'is a string'})
  end

  # test initialization and getter
  def test_string_key_getter
    assert_equal('is a string', @str_keys.key1)
  end

  def test_string_key_setter
    @str_keys.key1 = 'a new value'
    assert_equal('a new value', @str_keys.key1)
  end

  # test the current hash of instance variables is returned
  def test_string_key_hash
    assert_equal({'key1' => 'is a string'}, @str_keys.to_h)
    @str_keys.key1 = 'a new value'
    assert_equal({'key1' => 'a new value'}, @str_keys.to_h)
  end

  # test json structure of instance variables
  def test_string_key_json
    assert_equal('{"key1":"is a string"}', @str_keys.to_j)
  end
end