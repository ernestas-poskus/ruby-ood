
# adapters/bluecloth.rb

require "bluecloth"

module Marky
	module Adapters
		module Bluecloth
			extend self
			def to_html(s)
				::BlueCloth.new(s).to_html
			end
		end
	end
end
