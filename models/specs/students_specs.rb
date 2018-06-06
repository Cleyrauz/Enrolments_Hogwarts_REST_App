require("minitest/autorun")
require_relative("../student")

class TestStudent < MiniTest::Test

  def setup
    options = {"id" => 1, "first_name" => "Blanca", "second_name" => "White",
      "house" => "Gryffindor", "age" => 19}

    @student = Student.new(options)
  end

  def test_first_name()
    result = @student.first_name()
    assert_equal("Blanca", result)
  end


  def test_second_name()
    result = @student.second_name()
    assert_equal("White", result)
  end

  def test_house()
    result = @student.house()
    assert_equal("Gryffindor", result)
  end

  def test_age()
    result = @student.age()
    assert_equal(19, result)
  end

  # def test_complete_name()
  #   result = @student.complete_name()
  #   assert_equal("Blanca White", result)
  # end

end
