require 'test/unit'
require 'abstract'

class AbstractTestHelper < Abstract

  def initialize
    'initialized'
  end
end

class AbstractTestHelperMove < AbstractTestHelper

  def move
    'moving'
  end
end

class AbstractTest < Test::Unit::TestCase

  def test_ImplementationErrorCannotInitializeAbstractClass
    assert_raise(NotImplementedError) { Abstract.new }
  end

  def test_ImplementationErrorMethodNotDefined
    assert_raise(NotImplementedError) { AbstractTestHelper.new.move }
  end

  def test_ImplementedMethods
    assert_nothing_raised() { AbstractTestHelperMove.new }
  end

end