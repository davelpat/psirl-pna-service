require 'minitest/autorun'
require 'shoulda/context'
require_relative '../features/support/env'
require_relative '../features/support/base_test_object'

class TestBaseTestObject < Minitest::Test

  context 'a BaseTestObject' do
    setup do
      @str_keys = BaseTestObject.new({'key1' => 'is a string'})
      @sym_keys = BaseTestObject.new({:key3 => 42, :key2 => 'the answer'})
    end

    should 'initialize and read instance variables from a hash with string keys' do
      assert_equal('is a string', @str_keys.key1)
    end

    should 'initialize and read instance variables from a hash with symbol keys' do
      assert_equal('the answer', @sym_keys.key2)
    end

    should 'set new values on assignment to string keys' do
      @str_keys.key1 = 'a new value'
      assert_equal('a new value', @str_keys.key1)
    end

    # TODO: figure out why this is failing
    should 'set new values on assignment to symbol keys' do
      @sym_keys.key2 = 'a newer value'
      assert_equal('a newer value', @sym_keys.key2)
      @sym_keys.key3 = 13
      assert_equal(13, @sym_keys.key3)
    end

    should 'return a hash of the initial instance variables' do
      assert_equal({'key1' => 'is a string'}, @str_keys.to_h)
      assert_equal({:key3 => 42, :key2 => 'the answer'}, @sym_keys.to_h)
    end

    should 'return a hash of the current instance variables' do
      @str_keys.key1 = 'a new value'
      assert_equal({'key1' => 'a new value'}, @str_keys.to_h)
    end

    should 'return a json string of the initial instance variables' do
      assert_equal('{"key1":"is a string"}', @str_keys.to_j)
      assert_equal('{"key3":42,"key2":"the answer"}', @sym_keys.to_j)
    end

    should 'report its key type' do
      assert_equal(String, @str_keys.hash_key_class)
      assert_equal(Symbol, @sym_keys.hash_key_class)
    end

    should 'return its key as a string' do
      assert_equal('key1', @str_keys.key1_strname)
      assert_equal('key3', @sym_keys.key3_strname)
    end

  end
end