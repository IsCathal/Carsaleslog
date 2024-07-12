require 'rails_helper'

RSpec.describe Sale, type: :model do
  before(:all) do
    @salesperson = Salesperson.create(firstName: 'John', lastName: 'Doe')
    @salesperson.save
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      salesperson = Salesperson.new(firstName: 'John', lastName: 'Doe')
      salesperson.save
      sale = Sale.new(carModel: 'Opel', salesDate: '10/10/20241', fuelType: 'Petrol', salesperson_id: @salesperson.id)
      expect(sale).to be_valid
    end

    it 'is not valid without a carModel' do
      sale = Sale.new(salesDate: '10/10/2024', fuelType: 'Petrol', salesperson_id: @salesperson.id)
      expect(sale).not_to be_valid
    end

    it 'is not valid with a short carModel' do
      sale = Sale.new(carModel: 'Op', salesDate: '10/10/2024', fuelType: 'Petrol', salesperson_id: @salesperson.id)
      expect(sale).not_to be_valid
    end

    it 'is not valid without a salesDate' do
      sale = Sale.new(carModel: 'Opel', fuelType: 'Petrol', salesperson_id: @salesperson.id)
      expect(sale).not_to be_valid
    end

    it 'is not valid with a short salesDate' do
      sale = Sale.new(carModel: 'Op', salesDate: '2024', fuelType: 'Petrol', salesperson_id: @salesperson.id)
      expect(sale).not_to be_valid
    end
  end
end
