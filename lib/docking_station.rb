require_relative "bike"

class DockingStation

attr_reader :bike

  def dock(bike)
    @bike = bike
  end

  def release_bike
    Bike.new
  end

end

#station = DockingStation.new

#station.release_bike
