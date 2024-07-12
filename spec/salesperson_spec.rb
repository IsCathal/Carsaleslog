require 'rails_helper'

RSpec.describe Salesperson, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      salesperson = Salesperson.new(firstName: 'John', lastName: 'Doe')
      expect(salesperson).to be_valid
    end

    it 'is not valid without a first name' do
      salesperson = Salesperson.new(lastName: 'Doe')
      expect(salesperson).not_to be_valid
    end

    it 'is not valid with a short first name' do
      salesperson = Salesperson.new(firstName: 'Jo', lastName: 'Doe')
      expect(salesperson).not_to be_valid
    end

    it 'is not valid without a last name' do
      salesperson = Salesperson.new(firstName: 'John')
      expect(salesperson).not_to be_valid
    end

    it 'is not valid with a short last name' do
      salesperson = Salesperson.new(firstName: 'John', lastName: 'De')
      expect(salesperson).not_to be_valid
    end
  end

  before(:each) do
    @salesperson1 = Salesperson.create(firstName: 'John', lastName: 'Doe')
    @salesperson2 = Salesperson.create(firstName: 'Jane', lastName: 'Smith')

    # Create sales for salesperson1
    5.times { Sale.create(carModel: 'Opel', salesDate: '2024-10-10', fuelType: 'Petrol', salesperson: @salesperson1) }

    # Create sales for salesperson2
    3.times { Sale.create(carModel: 'Opel', salesDate: '2024-10-10', fuelType: 'Petrol', salesperson: @salesperson2) }
  end

  describe '#display_first_last' do
    it 'returns the full name with best salesperson tag for the best salesperson' do
      expect(@salesperson1.display_first_last).to eq('John Doe (Best salesperson)')
    end
  end
end
