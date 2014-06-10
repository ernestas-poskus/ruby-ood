=begin
  @Author: Ernestas Poskus
  @Author-URI: out13.com

  @LinkedIn: linkedin.com/in/ernestasposkus/
  @GitHub: github.com/ernestas-poskus

  -----
  @date: 12/2/13 - 5:29 PM
  Project: CarStore
=end
require 'factory'

class CarStore

  def buyCar(brand)
    Factory.new.create(brand)
  end

end