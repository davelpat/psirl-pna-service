require 'minitest/autorun'
require_relative 'env'
require_relative 'base_test_object'

class TestBaseTestObject < Minitest::Test

  def setup
    @str_keys = BaseTestObject.new({'key1' => 'is a string'})
  end

  def test_string_keys
    # test initialization and getter
    assert_equal('is a string', @str_keys.key1)

    # test setter
    @str_keys.key1 = 'a new value'
    assert_equal('a new value', @str_keys.key1)

    # test the current hash of instance variables is correct
    assert_equal({'key1' => 'a new value'}, @str_keys.to_h)

    # test json structure of instance variables
    assert_equal('{"key1":"a new value"}', @str_keys.to_j)
  end
end
