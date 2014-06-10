=begin
  @Author: Ernestas Poskus
  @Author-URI: out13.com

  @LinkedIn: linkedin.com/in/ernestasposkus/
  @GitHub: github.com/ernestas-poskus

  -----
  @date: 03/20/14 - 20:13 PM
  Project: Adapter pattern
  
	@Description: an adapter is used when you want to provide a unified interface
		to a number of different objects that implement similar functionality. 
		This pattern is easy to spot in the wild for a Ruby developer, as most
		of us have to use ActiveRecord in our day to day work. Under the hood, Active
		Record talks to a large amount of different databases, but wraps them up in a common
		interface its implementation code can avoid worrying about their individual 
		differences. This is exactly the sort of thing the Adapter pattern is useful for.

	@Definition: Convert the interface of class into another interface client expect. 
		Adapter lets classes work together, that could not otherwise because of incompatible interfaces.

  @Problem solves: Objects Adapters are the classical example of the adapter pattern. It uses composition,
		the Adaptee delegates the calls to Adaptee (opossed to class adapters which extends the Adaptee). 
		This behaviour give us a few advantages over the class adapters. The main advantage is that the Adapter 
		adapts not only the Adaptee but all its subclasses. All it's subclasses with one "small" restriction:
		all the subclasses which don't add new methods, because the used mechanism is delegation. So for any
		new method the Adapter must be changed or extended to expose the new methpds as well.
		The main disadvantage is that it requires to write all the code for delegating all the necessary requests
		for the Adaptee. 	

  Applicability & Examples
  - When one has a class (Target) that invokes methods defined in an interface and you have a another 
		class (Adapter) that doesnt implement the interface but implements the operations that should be invoked
		from the first class through the interface. You can change none of the existing code. The adapter will 
		implement the interace will be the bridge between the 2 classes.
	- When you write a class (Target) for a generic use relying on some general interfaces and you have some
		implemented classes, not implementing the interface, that needs to be invoked by the Target class.
	- Software e.g.: wrappers to adopt 3rd parties libraries and frameworks - most of the applications using third
		party libraries use adapters as a middle layer between the application and the 3rd party library do decouple
		the application from the library. If another library has to be used only and adapter for the new library 
		is required wihout having to change the application code.


  The participants classes in this pattern are:
  -	Target - defines domain-specific interface that Client uses.
	-	Adapter - adapts the interface Adaptee to the Target interface
	-	Adaptee - defines an existing interface that needs adapting
	-	Client - collaborates with objects conforming to the Target interface	

=end


module Marky
	extend self

	def adapter
		return @adapter if @adapter
		self.adapter = :rdiscount
		@adapter
	end

	def adapter=(adapter_name)
		case adapter_name
		when Symbol, String	
			require "adapters/#{adapter_name}"
			@adapter = Marky::Adapters.const_get("#{adapter_name.to_s.capitalize}")
		else
			raise "Missing adapter name #{adapter_name}"
		end
	end

	def to_html(s)
		adapter.to_html(s)	
	end
end



