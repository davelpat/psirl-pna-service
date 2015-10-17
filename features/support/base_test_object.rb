class BaseTestObject
  # abstract base test object class, which defines common functions across object types

  # initialize takes a hash of arguments and creates an object with attributes defined by the hash
  #   Creates the setter and getter methods for those variables and a method that returns the string name of each
  #   hash key (e.g. for key 'id', 'id_strname')
  #   also stores the class of the hash keys (String or Symbol) in @hash_key_class, a read-only instance variable
  # @param hash [Hash{String, Symbol => <value>}] the initialization argument list; keys may be Symbols or Strings
  # @return [Object] the type of the object depends on the calling class
  def initialize(hash)
    # Remember what kind of hash was used to initialize the object
    key_class = hash.first[0].class
    self.instance_variable_set("@hash_key_class", key_class)
    self.class.send(:define_method, 'hash_key_class', proc { self.instance_variable_get("@hash_key_class") })
    hash.each do |k, v|
      ## create and initialize an instance variable for this key/value pair
      add_instance_variable(k, v)
    end
  end

  # create and initialize an instance variable for a key/value pair, including its accessors
  # @param k [String, Symbol] the key
  # @param v [Object] the initial value of the key
  def add_instance_variable(k, v)
    self.instance_variable_set("@#{k}", {"#{k}" => v})
    ## create the setter that sets the instance variable value
    self.class.send(:define_method, "#{k}=", proc { |v| self.instance_variable_set("@#{k}", {"#{k}" => v}) })
    ## create the getter that returns the instance variable value
    self.class.send(:define_method, "#{k}", proc { self.instance_variable_get("@#{k}")["#{k}"] })
    ## create the getter that returns the instance name as a string; useful in error messages
    self.class.send(:define_method, "#{k}_strname", proc { self.instance_variable_get("@#{k}").first[0] })
  end

  # Returns an updated hash of the instance variables with the same class of keys as the object was initialized with
  # @return [Hash]
  def to_h
    self.instance_variables.inject({}) { |hash, var|
      iv = self.instance_variable_get("#{var}")
      if iv.class == Hash
        if self.hash_key_class == Symbol
          hash.merge({iv.first[0].to_sym => iv.first[1]})
        else # it's a string
          hash.merge(iv)
        end
      else # do not capture the associated meta-data
        hash
      end
    }
  end

  # Returns the object instance variables as a json object
  # @return [Json]
  def to_j
    JSON.generate self.to_h
  end

end # BaseTestObject