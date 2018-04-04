require_relative('../db/sql_runner')

class Animal

  attr_accessor :name, :species, :adoptable, :age, :admission_date, :owner_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @species = options['species']
    @adoptable = options['adoptable']
    @age = options['age']
    @admission_date = options['admission_date']
    @owner_id = options['owner_id']
  end


  def save()
    sql = "INSERT INTO animals
    (
      name,
      species,
      adoptable,
      age,
      admission_date
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @species, @adoptable, @age, @admission_date]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end


  def update()
    sql = "UPDATE animals
    SET
    (
      name,
      species,
      adoptable,
      age,
      admission_date
      ) =
      (
        $1, $2, $3, $4, $5
      )
      WHERE id = $6"
      values = [@name, @species, @adoptable, @age, @admission_date, @id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM animals"
      results = SqlRunner.run( sql )
      return results.map { |animal| Animal.new(animal) }
    end

    def owner()
      owner = Owner.find(@owner_id)
      return owner
    end

    def self.find(id)
      sql = "SELECT * FROM animals
      WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values).first
      animal = Animal.new(result)
      return animal
    end

    def self.delete_all()
      sql = "DELETE FROM animals"
      SqlRunner.run( sql )
    end

    def self.destroy(id)
      sql = "DELETE FROM animals
      WHERE id = $1"
      values = [id]
      SqlRunner.run( sql, values )
    end

    def delete()
      sql = "DELETE FROM animals
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def adopt()
      if @adoptable != "No"
        sql = "UPDATE animals
        SET (owner_id) = ($1)
        WHERE id = $2"
        values = [@owner_id, @id]
        SqlRunner.run(sql, values)
      end
    end




  end
