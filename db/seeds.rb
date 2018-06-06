require_relative('../models/student')
require_relative('../models/house')
# require('pry-byebug')

Student.delete_all()
House.delete_all()

house1 = House.new({
  "name" => "Gryffindor"
})
house2 = House.new({
  "name" => "Ravenclaw"
})
house3 = House.new({
  "name" => "Hufflepuff"
})
house4 = House.new({
  "name" => "Slytherin"
})

house1.save
house2.save
house3.save
house4.save

student1 = Student.new({
  "first_name" => "Bianca",
  "second_name" => "White",
  "house_id" => house1.id,
  "age" => 19
})

student2 = Student.new({
  "first_name" => "Rosa",
  "second_name" => "Rose",
  "house_id" => house1.id,
  "age" => 12
})

student1.save
student2.save


student1.first_name = "Blanca"
student1.update

Student.all
Student.find(student1.id)


House.all
House.find(house1.id)

# student2.delete
