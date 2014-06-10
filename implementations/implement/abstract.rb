=begin
  @Author: Ernestas Poskus
  @Author-URI: out13.com

  @LinkedIn: linkedin.com/in/ernestasposkus/
  @GitHub: github.com/ernestas-poskus

  -----
  @date: 12/2/13 - 5:29 PM
  Project: Abstract
=end

class Class

  def abstract(*args)
    args.each do |method_name|
      define_method(method_name) do |*args|
        if method_name == :initialize
          msg = "#{self.class.name} is an abstract class."
        else
          msg = "Class [#{self.class.name}] method [#{method_name}] is an abstract method."
        end
        raise NotImplementedError.new(msg)
      end
    end
  end

end

class Abstract
  abstract :initialize, :move
end