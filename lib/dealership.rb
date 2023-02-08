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
end