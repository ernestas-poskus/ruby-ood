=begin
  @Author: Ernestas Poskus
  @Author-URI: out13.com

  @LinkedIn: linkedin.com/in/ernestasposkus/
  @GitHub: github.com/ernestas-poskus

  -----
  @date: 12/2/13 - 5:29 PM
  Project: Singleton pattern

  @Definition: it allows you to have one and only one instance of a class in your system.
  * Singleton pattern - by some considered grand daddy of all patterns.
  * Considered as "Global" variable which undermines encapsulation.

  @Pros:
  - Makes Object/Method available throughout system
  - Object/Method should not be stored in global variable, which can be overwritten
  - Only 1 Object/Method and no more available in the system.
  - Improvement over Global variables
  - Cannot overwrite data

  @Cons:
  - Hard to debug/ test
  - Dependency problems

=end

class Singleton1

  attr_accessor :var
  @@instance = nil
  @var = nil

  private_class_method :new # Disable initializing

  def self.instance()
    @@instance ||= new
  end

  def log
     'Logged'
  end

  def dup
    raise TypeError, "can't dup instance of singleton #{self.class}"
  end

  def clone
    raise TypeError, "can't clone instance of singleton #{self.class}"
  end




end