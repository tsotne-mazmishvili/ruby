#ათობითში გადაყვანა
def atobitshi_gadayvana(num_to_convert, from_base)
  decimal = 0
  power = 0

  (0...num_to_convert.to_s.length).each do |x|
    decimal = decimal + ((num_to_convert[x].to_i) * (from_base ** power))
    power += 1
  end
decimal
end

#რამდენჯერ მოთავსდება ახალი ფუძის ხარისხები ათობით რიცხვში; საჭიროა შემდგდომი კონვერტაციისათვის
def caluclate_powers(decimal, to_base)
  powers_list = []
  power = 0
  counter = 0

  while power < decimal
    power = to_base ** counter
    powers_list.append(power)
    counter += 1
  end
  powers_list
end

#ათობითიდან ნებისმიერობითში
def convert_to_any_base(powers_list, decimal)
  result = ""
  index = -1
  reminder = decimal

  powers_list.each do |x|
    number = reminder / powers_list[index]
    #65 = A
    if number > 9
      number = (65 + (number - 10)).chr
    end

    result += (number).to_s
    reminder = reminder % powers_list[index]
    index -= 1
  end
  result.slice!(0) if result[0] == "0"
  result
end

def check_number(from_base, num_to_convert)
    (0...num_to_convert.length).each do |x|
      raise ArgumentError if num_to_convert[x].to_i >= from_base.to_i
    end
end
def main
  print "from base: "
  from_base = gets.chomp()
  print "number: "
  num_to_convert = gets.chomp()
  num_to_convert = num_to_convert.reverse
  print "to base: "
  to_base = gets.chompp()

  check_number(from_base,num_to_convert)
  decimal = atobitshi_gadayvana(num_to_convert, from_base.to_i)
  powers_list = caluclate_powers(decimal, to_base.to_i)
  puts "result is: " + convert_to_any_base(powers_list, decimal)

end
begin
  main
rescue ArgumentError
  puts "!!!wrong base or number!!!"
  retry
end
