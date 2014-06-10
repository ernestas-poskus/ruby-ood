=begin
  @Author: Ernestas Poskus
  @Author-URI: out13.com

  @LinkedIn: linkedin.com/in/ernestasposkus/
  @GitHub: github.com/ernestas-poskus

  -----
  @date: 12/28/13 - 2:39 PM
  Project: Builder pattern
  Builder pattern defines an instance for creating an object but letting subclasses decide which class to instantiate
  Refers to the newly created object through a common interface

  @Definition: defines an instance for creating an object but letting subclasses decide which class to
  instantiate and Allows a finer control over the construction process.

  @Problem solves: products created by the concrete builders have a structure significantly different,
  so if there is not a reason to derive different products a common parent class.
  This also distinguishes the Builder pattern from the Abstract Factory pattern which creates objects derived from a common type.


  Applicability & Examples
    the creation algorithm of a complex object is independent from the parts that actually compose the object
    the system needs to allow different representations for the objects that are being built

  The participants classes in this pattern are:
    Builder class - specifies an abstract interface for creating parts of a Product object.
    ConcreteBuilder - constructs and puts together parts of the product by implementing the Builder interface. It defines and keeps track of the representation it creates and provides an interface for saving the product.
    Director class - constructs the complex object using the Builder interface.
    Product - represents the complex object that is being built.

=end

# Abstract Bulder class
class Builder

  (1..3).each do |i|
    define_method("build_part#{i}") {}
  end

end

# Concrete Builder implements Abstract Builder
class ConcreteTableBuilder

  def build_part1
    'Legs'
  end

  def build_part2
    'Top'
  end

  def build_part3
    'Mounting'
  end

end


# Concrete Builder implements Abstract Builder
class ConcreteComputerBuilder

  def build_part1
    'Motherboard'
  end

  def build_part2
    'CPU'
  end

  def build_part3
    'RAM'
  end

end


# Object constructor which uses Builder Interface
class Director

  # Receives a builder object from as a parameter from Client
  def construct(builder)
    @build = builder
    self.build
  end

  protected

  #Responsible for calling the appropriate methods of the Builder class
  def build
    @build.build_part1 + @build.build_part2 + @build.build_part3
  end

end





























