require_relative "drill"
require_relative "electric_car"
require_relative "motorized_battery_powered_thing"
require_relative "phone"

drill = Drill.new
drill.charge
puts "drill pwoer level: #{drill.power_level}"

car = ElectricCar.new
car.charge
car.charge
car.rev_motor
puts "car power level: #{car.power_level}"

phone = Phone.new
phone.charge
phone.charge
phone.charge
puts "phone power level: #{phone.power_level}"
