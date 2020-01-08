module BatteryPowered
  attr_writer :power_level

  def power_level
    @power_level ||= 0
  end

  def charge
    self.power_level += 1
  end
end
