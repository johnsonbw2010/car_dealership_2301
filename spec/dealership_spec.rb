require 'rspec'
require './lib/car'
require './lib/dealership'

RSpec.describe Dealership do
  it 'exists' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")

    expect(dealership.inventory).to eq([])
    expect(dealership.inventory_count).to eq(0)
  end

  it 'can add to inventory' do
  dealership = Dealership.new("Acme Auto", "123 Main Street")
  car_1 = Car.new("Ford Mustang", 1500, 36)
  car_2 = Car.new("Toyota Prius", 1000, 48)
  dealership.add_car(car_1)
  dealership.add_car(car_2)
  expect(dealership.inventory_count).to eq(2)
  end

  it 'differentiates between inventory or no inventory' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    expect(dealership.has_inventory?).to eq(false)
    dealership.add_car(car_1)
    expect(dealership.has_inventory?).to eq(true)
  end

  it 'can filter by make' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tacoma", 1250, 48)
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    expect(dealership.cars_by_make("Ford").count).to eq(1)
    expect(dealership.cars_by_make("Toyota").count).to eq(2)
    expect(dealership.cars_by_make("Honda").count).to eq(0)
  end
  it 'can assess total value of inventory' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)
    expect(dealership.has_inventory?).to eq(false)
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    dealership.add_car(car_4)
    expect(dealership.has_inventory?).to eq(true)
    expect(dealership.total_value).to eq (156000)
    require 'pry'; binding.pry
  end

  it 'can list details of dealership' do
    dealership = Dealership.new("Acme Auto", "123 Main Street")
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    dealership.add_car(car_4)
    expect(dealership.details).to eq("Total value is 156000, and the dealership is located at 123 Main Street")
  end
end