require_relative 'csv_reader'
require_relative 'csv_writer'
require_relative 'gpa_printer'

reader = CsvReader.new

reader.csv_reader(ARGV[0])

writer = CsvWriter.new(reader.data_of_students)
writer.write_students_names_csv

printer = PrintGpa.new(reader.data_of_students)
printer.print_gpa

puts "Total debt of all students = #{reader.total_debt}"

ARGV.clear
print "input student name: "
student_name = gets.chomp
puts "#{student_name} debt: #{reader.student_debt(student_name)} "
