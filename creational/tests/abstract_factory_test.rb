require 'test/unit'
require 'abstract_factory'

class AbstractFactoryTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Concrete - Factories
    @concrete1 = ConcreteFactory1.new
    @concrete2 = ConcreteFactory2.new
  end

  def test_AbsFactProduct1
    assert_equal('Bonjour, from ConcreteProduct1', Client.new(@concrete1).run)
  end

  def test_AbsFactProduct2
    assert_equal('Privet, from ConcreteProduct2', Client.new(@concrete2).run)
  end

  def test_AbsFactNotImplementedError
    assert_raise(NotImplementedError) { Client.new(AbstractFactory.new).run}
  end

  def test_AbsProductNotImplmentedError
    assert_raise(NotImplementedError) { AbstractProduct.new.product_action }
  end

end