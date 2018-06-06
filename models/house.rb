require_relative('../db/sql_runner')
require_relative('student')

class House


  attr_reader :id
  attr_accessor :name

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO houses(name) VALUES ($1) RETURNING id"
    values = [@name]
    house_data = SqlRunner.run(sql, values)
    @id = house_data.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM houses;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run( sql )
    result = houses.map { |house| House.new( house ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run( sql, values )
    result = House.new( house.first )
    return result
  end

  def update()
  sql = "UPDATE houses SET (name) = ($1) WHERE id = $2"
  values = [@name, @id]
  SqlRunner.run(sql, values)
end

def delete()
  sql = "DELETE FROM houses WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.find( id )
  sql = "SELECT * FROM houses WHERE id = $1"
  value = [id]
  house = SqlRunner.run(sql, value)
  result = House.new( house.first )
  return result
end

end
