=begin
  @Author: Ernestas Poskus
  @Author-URI: out13.com

  @LinkedIn: linkedin.com/in/ernestasposkus/
  @GitHub: github.com/ernestas-poskus

  -----
  @date: 12/2/13 - 5:29 PM
  Project: AbstractFactory pattern
  Abstract Factory is a super-factory which creates other factories (Factory of factories)

  @Definition: provides an interface for creating families of related or dependant
  objects without specifying their concrete class

  @Problem solves: offers the interface for creating a family of related objects,
  without explicitly specifying their classes.

  @Pros:
  - Master of factories
  - Encapsulates creation of new factories
  - Accessed through abstract interface

  @Cons:
  - Mirrors code hierarchy
  - Encourages unnecessary sub-classing
  - "Special kind" of code duplication


  Applicability & Examples
    the system needs to be independent from the way the products it works with are created.
    the system is or should be configured to work with multiple families of products.
    a family of products is designed to work only all together.
    the creation of a library of products is needed, for which is relevant only the interface, not the implementation, too.

  The classes that participate to the Abstract Factory pattern are:
    AbstractFactory - declares a interface for operations that create abstract products.
    ConcreteFactory - implements operations to create concrete products.
    AbstractProduct - declares an interface for a type of product objects.
    Product - defines a product to be created by the corresponding ConcreteFactory; it implements the AbstractProduct interface.
    Client - uses the interfaces declared by the AbstractFactory and AbstractProduct classes.

=end

# Abstract Factory Interface
class AbstractFactory
  def create_action
    raise NotImplementedError, "#{self.class.name} method must be implemented"
  end
end

# Concrete Factory for product1
class ConcreteFactory1 < AbstractFactory
  def create_action
    ConcreteProduct1.new
  end
end

# Concrete Factory for product2
class ConcreteFactory2 < AbstractFactory
  def create_action
    ConcreteProduct2.new
  end
end

#######################################################################################

# Abstract Product Interface
class AbstractProduct
  def product_action
    raise NotImplementedError, "#{self.class.name} method must be implemented"
  end
end

# Concrete Product 1
class ConcreteProduct1 < AbstractProduct
  def product_action
    "Bonjour, from #{self.class.name}"
  end
end

# Concrete Product 2
class ConcreteProduct2 < AbstractProduct
  def product_action
    "Privet, from #{self.class.name}"
  end
end

#######################################################################################

# Client user of Factories / Products
class Client
  def initialize( specific_factory)
    @needed_factory = specific_factory
  end

  def run
    @needed_factory.create_action.product_action
  end
end









































