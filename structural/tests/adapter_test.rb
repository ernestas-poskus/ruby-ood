require 'test/unit'
require 'adapter'

class AdapterTest < Test::Unit::TestCase

	def setup

		@bc = Marky
		@bc.adapter = :bluecloth

		@rd = Marky
		@rd.adapter = :rdiscount

	end

	def test_outputFrom2DifferentAdaptedParsersShouldBeEqual
		str = 'hellow world from unit test'
		assert_equal @bc.to_html(str), @rd.to_html(str)
	end

	def test_shouldRaiseErrorWhenAdapterDoesNotExist
		m = Marky
		assert_raise(LoadError) { m.adapter = :not_existing }
	end

end
