class Placing
  attr_accessor :name, :place

  def initialize(name=nil,place=nil)
    @name = name
    @place = place
  end

  def mongoize
    {name: @name, place: @place}
  end

  def self.mongoize(object)
    case object
    when self.class then
      object.mongoize
    when nil
      nil
    else
      object
    end
  end

  def self.demongoize(object)
    case object
    when Hash then
      Placing.new(object[:name], object[:place])
    when nil then
      nil
    else
      object
    end
  end

  def self.evolve(object)
    mongoize(object)
  end
end
