require 'test/unit'
require 'pool'


# Abstract Connection
class Connection;
end

class PoolClient

  def connect
    @conn = ConnectionPool.getInstance.acquire
  end

  def disconnect
    ConnectionPool.getInstance.release(@conn)
    @conn = nil
  end

end

class PoolTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup

    # Connection Pool instance
    @pool = ConnectionPool.getInstance

    @client1 = PoolClient.new
    @client2 = PoolClient.new
    @client3 = PoolClient.new
    @client4 = PoolClient.new
    @client5 = PoolClient.new
  end


  def test_Client1_AttemptsConnection
    assert_empty @pool, 'Pool is not empty'
    assert @client1.connect, 'Client1 failed to connect'
    @client1.disconnect
    assert_not_empty @pool, 'Object didnt return to pool'
  end

  def test_Clients_ConnectAndDisconnect
    assert @client1.connect, 'Client1 failed to connect'
    assert @client2.connect, 'Client2 failed to connect'
    assert @client3.connect, 'Client3 failed to connect'
    assert @client4.connect, 'Client4 failed to connect'

    assert @pool.show.length == 0, 'Pool should be empty'
    @client3.disconnect
    assert @pool.show.length == 1, 'Pool should contain 1 object'
    @client1.disconnect
    @client2.disconnect
    assert @pool.show.length == 3, 'Pool should contain 3 objects'
    @client4.disconnect
    assert @pool.show.length == 4, 'Pool should contain 4 objects'
  end

  def test_Clients_PoolClone
    assert @client2.connect, 'Client2 failed to connect'
    assert @client3.connect, 'Client3 failed to connect'
    @client2.disconnect
    @client3.disconnect
    pool_clone = @pool.show.clone

    assert_equal @pool.show, pool_clone
  end

  def test_Clients_MaximumPoolSizeReached
    assert @client1.connect, 'Client1 failed to connect'
    assert @client2.connect, 'Client2 failed to connect'
    assert @client3.connect, 'Client3 failed to connect'
    assert @client4.connect, 'Client4 failed to connect'
    assert @client5.connect, 'Client5 failed to connect'
  end

end