require 'csv'
require_relative 'student'

class CsvReader
  attr_reader :data_of_students

  def initialize
    @data_of_students = []
  end

  def csv_reader(csv_file_name)
    CSV.foreach(csv_file_name, headers: true) do |row|
    @data_of_students << Student.new(row["name"], row["lat_name"], row["gpa"], row["debt"])
    end
  end

  def total_debt
    sum = 0
    @data_of_students.each{|student| sum += student.debt.to_i}
    sum
  end

  def student_debt(student_name)
    debt_of_student = 0
    @data_of_students.each do |student|
      debt_of_student = student.debt if student.name == student_name
    end
    debt_of_student
  end
end
