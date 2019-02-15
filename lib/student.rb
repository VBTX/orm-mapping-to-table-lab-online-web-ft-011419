class Student
  attr_accessor :name
  attr_reader :id, :grade

  def initialize (name, grade, id = nil)
    @name = name
    @grade = grade
    @id = id
  end

  def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS students(
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade TEXT
    )
    SQL

      DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
    DROP TABLE students
      SQL
      DB[:conn].execute(sql)
    end

  def save
    sql = <<-SQL
    INSERT INTO students(name, grade)
    VALUES (?, ?)
      SQL
      DB[:conn].execute(sql, self.name. self.grade)
    end

  end

end
