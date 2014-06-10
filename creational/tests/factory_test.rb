require 'test/unit'
require 'car_store'

class FactoryTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @bmw = CarStore.new
    @jeep = CarStore.new
    @ford = CarStore.new
    @dodge = CarStore.new

  end

  def test_buyCar
    assert_equal 'Bmw', @bmw.buyCar('bmw').carName
    assert_equal 'Jeep', @jeep.buyCar('jeep').carName
    assert_equal 'Ford', @ford.buyCar('ford').carName
    assert_equal 'Dodge', @dodge.buyCar('dodge').carName
  end

  def test_CarDoesNotExist
    assert_raise(NotImplementedError) { CarStore.new.buyCar('benz') }
  end

  def test_CarStoreHasMethodBuyCar
    assert CarStore.new.respond_to? 'buyCar'
  end

  def test_CarStoreDoesNotHaveMethod
    assert !CarStore.new.respond_to?('busyCar'), 'No such method'
  end

end