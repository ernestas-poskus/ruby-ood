=begin
  @Author: Ernestas Poskus
  @Author-URI: out13.com

  @LinkedIn: linkedin.com/in/ernestasposkus/
  @GitHub: github.com/ernestas-poskus

  -----
  @date: 12/29/13 - 10:56 PM
  Project: 'Objects Pool' Pattern

  @Definition: reuses and shares objects that are expensive to create (from pool of objects)

  @Problem solves: object pool is handling the object instantiation it's main purpose is to provide a way
  for the clients to reuse the objects like they are new objects, without being shared and reused.

  @Usage:
  - Thread pools / Database connection pool

  @Pros:
  - Reusable objects
  - Saves resources and initialization time of new objects/connection
  - Global access to 'Objects pool'

  @Cons:
  - Singleton reusable pool
  - Might be hard to manage
  - Tracking of object state can be hard to maintain (making object back to reusable)
  - Multiple Thread management, need to prevent from parallel object reuse by same Client


  Applicability & Examples
    Example of the database connections, obviously that opening too many connections
    might affect the performance for several reasons:
    Creating a connection is an expensive operation.
    When there are too many connections opened it takes longer to create a new one and the database server will become overloaded.

  The participants classes in this pattern are:
    Reusable - Wraps the limited resource, will be shared by several clients for a limited amount of time.
    Client - uses an instance of type Reusable.
    ReusablePool - manage the reusable objects for use by Clients, creating and managing a pool of objects.

    Resource loading strategy - eager or lazy;
    Resource loading mechanism - how to actually construct one;
    Access strategy - "round robin" which is not as straightforward as it sounds; this implementation can use a
    circular buffer which is similar, but not perfect, because the pool has no control over when resources are actually reclaimed.
    Other options are FIFO and LIFO; FIFO will have more of a random-access pattern,
    but LIFO makes it significantly easier to implement a Least-Recently-Used freeing strategy.

=end

require 'singleton'

# Object Pool pattern implemented
# Queue implemented using FIFO
class ConnectionPool

  include Singleton

  def initialize
    @queue = []
  end

  def self.getInstance
    @@instance ||= new
  end

  def empty?
    @queue.empty?
  end

  def length
    @queue.length
  end

  def push(obj)
    @queue.push obj
  end

  def pop
    @queue.pop
  end

  def acquire
    loop do
      return self.pop unless self.empty?
        self.push(Connection.new)
    end
  end

  def release(obj)
    self.push obj
  end

  def show
    @queue
  end

end

