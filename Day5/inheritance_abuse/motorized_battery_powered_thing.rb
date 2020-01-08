class MotorizedBatteryPoweredThing
  attr_accessor :power_level

  def initialize
    self.power_level = 0
  end

  def charge
    self.power_level += 1
  end

  def rev_motor
    puts "Revving motor!"
  end
end
