require 'minitest/autorun'
require 'shoulda/context'
require_relative '../features/support/env'
require_relative '../features/support/base_test_object'

class TestBaseTestObject < Minitest::Test

  context 'a BaseTestObject' do
    setup do
      @str_keys = BaseTestObject.new({'key1' => 'is a string'})
    end

    should 'initialize and read instance variables from a hash with string keys' do
      assert_equal('is a string', @str_keys.key1)
    end

    should 'set new values on assignment' do
      @str_keys.key1 = 'a new value'
      assert_equal('a new value', @str_keys.key1)
    end

    should 'return a hash of the initial instance variables' do
      assert_equal({'key1' => 'is a string'}, @str_keys.to_h)
    end

    should 'return a hash of the current instance variables' do
      @str_keys.key1 = 'a new value'
      assert_equal({'key1' => 'a new value'}, @str_keys.to_h)
    end

    should 'return a json string of the initial instance variables' do
      assert_equal('{"key1":"is a string"}', @str_keys.to_j)
    end
  end
end