class ObscuringReferences
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def diameters
    # 0 is rim, 1 is tire
    # p @data
    data.collect { |cell| cell[0] + (cell[1] * 2) }
    # data.collect do |cell|
    #   cell[0] + (cell[1] * 2)
    # end
  end
end

class RevealingReferences
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    wheels.collect { |wheel| wheel.rim + (wheel.tire * 2) }
  end

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect do |cell|
      Wheel.new(cell[0], cell[1])
    end
  end
end

o = ObscuringReferences.new([[622, 20], [622, 23], [559, 30], [559, 40]])
# p o.data
p o.diameters

o2 = RevealingReferences.new([[622, 20], [622, 23], [559, 30], [559, 40]])
p o2.diameters
