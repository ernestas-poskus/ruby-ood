require 'test/unit'
require 'builder'

class BuilderTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing

    @ConcreteTable = ConcreteTableBuilder.new
    @ConcreteComputer = ConcreteComputerBuilder.new
  end

  def test_AbstractBuilderDynamicMethods
    assert !Builder.new.respond_to?(:build_part_does_not_exist), 'Method: build_part_does_not_exist does not exist'
    assert Builder.new.respond_to?(:build_part1), 'Such method does not exist'
    assert Builder.new.respond_to?(:build_part2), 'Such method does not exist'
    assert Builder.new.respond_to?(:build_part3), 'Such method does not exist'
  end


  def test_ConcreteBuilderComputer
    assert_equal('Motherboard', ConcreteComputerBuilder.new.build_part1)
    assert_equal('CPU', ConcreteComputerBuilder.new.build_part2)
    assert_equal('RAM', ConcreteComputerBuilder.new.build_part3)
  end

  def test_ConcreteBuilderTable
    assert_equal('Legs', ConcreteTableBuilder.new.build_part1)
    assert_equal('Top', ConcreteTableBuilder.new.build_part2)
    assert_equal('Mounting', ConcreteTableBuilder.new.build_part3)
  end

  def test_DirectorWithConcreteTable
    assert Director.new.construct(@ConcreteTable), 'Director failed to initialize and construct "build" object'
    assert_equal 'LegsTopMounting', Director.new.construct(@ConcreteTable)
  end

  def test_DirectorWithComputerTable
    assert Director.new.construct(@ConcreteComputer), 'Director failed to initialize'
    assert_equal 'MotherboardCPURAM', Director.new.construct(@ConcreteComputer)
  end

end
