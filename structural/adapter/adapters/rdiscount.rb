
# adapters/rdiscount.rb

require 'rdiscount'

module Marky
	module Adapters
		module Rdiscount
			extend self
			def to_html(s)
				::RDiscount.new(s).to_html
			end
		end
	end
end
