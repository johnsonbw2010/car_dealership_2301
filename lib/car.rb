class Car
  attr_reader :make, :model, :monthly_payment, :loan_length, :color
  def initialize(make_model, monthly_payment, loan_length)
    @make = make_model
    @model = make_model
    @monthly_payment = monthly_payment
    @loan_length = loan_length
    @color = nil
  end

  def make
    make = @make.split(" ")
    @make = "#{make.first}"
  end

  def model
    model = @model.split(" ")
    @model = "#{model.last}"
  end

  def total_cost
    cost = @monthly_payment * @loan_length
    cost
  end

  def paint!(color)
    @color = color
  end
end