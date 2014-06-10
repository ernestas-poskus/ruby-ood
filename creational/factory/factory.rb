=begin
  @Author: Ernestas Poskus
  @Author-URI: out13.com

  @LinkedIn: linkedin.com/in/ernestasposkus/
  @GitHub: github.com/ernestas-poskus

  -----
  @date: 12/2/13 - 5:29 PM
  Project: Factory pattern

  @Definition: defines an interface for creating an object, but let subclasses
  decide which class to instantiate. Lets a class defer instantiation to subclasses.
  Extends system further without much change of existing functionality.

  @Pros:
  - Makes extending (adding new functionality) easy
  - Enables to use inheritance and polymorphism
  - Encapsulates creation of new "products"

  @Cons:
  - Mirrors code hierarchy
  - Encourages unnecessary sub-classing
  - "Special kind" of code duplication

=end
require 'cars/bmw'
require 'cars/dodge'
require 'cars/ford'
require 'cars/jeep'


class Factory

  def create(brand)

    case brand
      when 'jeep'
        Jeep.new
      when 'dodge'
        Dodge.new
      when 'bmw'
        Bmw.new
      when 'ford'
        Ford.new
      else
        raise NotImplementedError, 'No such car'
    end

  end
end