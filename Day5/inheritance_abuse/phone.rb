require_relative "motorized_battery_powered_thing"
require_relative "motorized_module"
require_relative "battery_powered_module"



class Phone < MotorizedBatteryPoweredThing
  include BatteryPowered
end
