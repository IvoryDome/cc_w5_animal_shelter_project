require_relative('../db/sql_runner')
require_relative('animal.rb')

class Owner

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO owners
    (name)
    VALUES
    ($1)
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE students
    SET
    (
      name
      ) =
      (
        $1
      )
      WHERE id = $2"
      values = [@name, @id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM owners"
      results = SqlRunner.run( sql )
      return results.map { |owner| Owner.new( owner ) }
    end

    def self.find(id)
      sql = "SELECT * FROM owners
      WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values).first
      owner = Owner.new(result)
      return owner
    end

    def self.delete_all()
      sql = "DELETE FROM owners"
      SqlRunner.run( sql )
    end

    def delete()
      sql = "DELETE FROM owners
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.destroy(id)
      sql = "DELETE FROM owners
      WHERE id = $1"
      values = [id]
      SqlRunner.run( sql, values )
    end

  end
