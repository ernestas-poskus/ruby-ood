require 'test/unit'
require 'prototype'

class PrototypeTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @client = PrototypeClient.new # Original object which is being cloned

    @prototype1 = @client.prototype_clone
    @prototype2 = @client.prototype_clone
    @prototype3 = @client.prototype_clone
  end


  def test_InitializingPrototypeClient
    assert PrototypeClient.new, 'Client initialization failed'
  end

  def test_PrototypeClonedObjectIdsAreNotEqual
    assert @prototype1.object_id != @prototype2.object_id, 'Objects ids are equal'
  end

  def test_PrototypeStateEqual
    assert @prototype2.state == @prototype1.state, 'Objects states are not equal'
  end

  def test_PrototypeChangedStatesNotEqual
    @prototype1.state = '2' # Changing object state
    assert @prototype3.state != @prototype1.state, 'States are equal'
  end

end