class Car
  attr_reader :make, :model, :monthly_payment, :loan_length, :color
  def initialize(make_model, monthly_payment, loan_length)
    mm = make_model.split(" ")
    @make = "#{mm.first}"
    @model = "#{mm.last}"
    @monthly_payment = monthly_payment
    @loan_length = loan_length
    @color = nil
  end

  def total_cost
    cost = @monthly_payment * @loan_length
    cost
  end

  def paint!(color)
    @color = color
  end
end