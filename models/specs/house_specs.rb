require("minitest/autorun")
require_relative("../house")

class TestHouse < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Gryffindor"}

    @house = House.new(options)
  end

  def test_house_has_a_name()
    result = @house.name()
    assert_equal("Gryffindor", result)
  end

end 
