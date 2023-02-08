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
    "$#{total_value.sum.to_s.scan(/.{1,3}/).join(',')}"
  end

  def details
    value = self.total_value
    return "Total value is #{value}, and the dealership is located at #{self.address}"
  end

  def average_price_of_car
    avg = []
    @inventory.each do |car|
      avg << car.total_cost
    end
    average_cost = "$#{(avg.sum).div(avg.count)}"
    average_cost.scan(/.{1,3}/).join(',')
  end

  def cars_sorted_by_price
    @inventory.sort_by do |car|
      car.total_cost
    end
  end
end