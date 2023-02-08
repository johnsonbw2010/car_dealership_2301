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
    car.make
    car.model
    @inventory << car
  end

  def has_inventory?
      if @inventory.length == 0
        false
      else true
      end
  end

  def cars_by_make(make)
    arr = []
    @inventory.find_all do |car|
      if car.make == make
        arr << car
      end
    end
  end

  def total_value
    total_value = []
    @inventory.each do |car|
      total_value << car.total_cost
    end
    total_value.sum
  end
end