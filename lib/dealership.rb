require './lib/car'
class Dealership
  attr_reader :inventory, :address, :name
  def initialize(name, address)
    @name = name
    @address = address
    @inventory = []
  end

  def inventory_count
    @inventory.length
  end

  def add_car(car)
    @inventory << car
  end

  def has_inventory?
      if @inventory.length == 0
        false
      else true
      end
  end
end