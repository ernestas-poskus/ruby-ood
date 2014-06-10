=begin
  @Author: Ernestas Poskus
  @Author-URI: out13.com

  @LinkedIn: linkedin.com/in/ernestasposkus/
  @GitHub: github.com/ernestas-poskus

  -----
  @date: 12/28/13 - 4:55 PM
  Project: Prototype
  Allows an object to create customized objects without knowing their class or any details of how to create them.

  @Definition: specify the kinds of objects to create using a prototypical instance, and
  crete new objects by copying this prototype

  @Problem solves: allows an object to create customized objects without knowing their class
  or any details of how to create them.

  @Pros:
  - Saves computer resources
  - Create customized objects without knowing their class
  - Create object at run-time
  - Avoiding factory method

  @Cons:
  - When application uses many prototypes - registry of available prototypes should be kept
  - Deep Clones vs. Shallow Clones - deciding how deep clone should be
  - Initializing Internal States – there are certain situations when objects need to be initialized after they are created.


  Applicability & Examples
    Classes to be instantiated are specified at run-time
    Avoiding the creation of a factory hierarchy is needed
    It is more convenient to copy an existing instance than to create a new one.

  The classes participating to the Prototype Pattern are:
    Client - creates a new object by asking a prototype to clone itself.
    Prototype - declares an interface for cloning itself.
    ConcretePrototype - implements the operation for cloning itself.

=end

# Abstract Prototype class
class Prototype

  def make_prototype
  end

end


# Concrete Prototype
class ConcretePrototype < Prototype

  def initialize
    # 1 - default
    # 2 - changed
    @state = 1
  end

  # Defined for testing purposes to see if changing cloned object state doesn't change original object state
  # which would mean they are the same and object is not cloned
  attr_accessor :state

  # Dup vs Clone - Dup: cannot clone singleton class, does not preserve frozen state
  def make_prototype
    self.clone
  end

end


class PrototypeClient

  def initialize
    @prototype = ConcretePrototype.new
  end

  def prototype_clone
    @prototype.make_prototype
  end

end
