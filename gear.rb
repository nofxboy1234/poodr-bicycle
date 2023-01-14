class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * diameter
  end

  def diameter
    rim + (tire * 2)
  end
end

gear1 = Gear.new(52, 11, 26, 1.5)
puts gear1.gear_inches
puts gear1.ratio
puts gear1.diameter
# puts Gear.new(52, 11).ratio
