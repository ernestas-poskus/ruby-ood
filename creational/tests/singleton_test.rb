require 'test/unit'
require 'singleton1'

class SingletonTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @single = Singleton1.instance
    @single2 = Singleton1.instance
    @single3 = Singleton1.instance
  end

  def test_compareObjectIdMemory
    assert_equal @single, @single2
    assert_equal @single2, @single3
  end

  def test_CanDup
    assert_raise(TypeError) { Singleton1.instance.dup }
  end

  def test_CanClone
    assert_raise(TypeError) { Singleton1.instance.clone }
  end

  def test_methodLog
    assert_equal 'Logged', Singleton1.instance.log
  end

  def test_hasMethod
    assert @single.respond_to?('log'), 'Method should exist'
    assert !@single.respond_to?('aw'), 'No such method'
  end

  def test_cantInitialize
    assert_raise(NoMethodError) { Singleton1.new }
  end

  def test_same
    assert @single3.var.nil? # Check if initially is nil

    @single.var = 'Some' # Set with other instance

    assert_equal 'Some', @single2.var # Check if equal getting from other instance
  end


end