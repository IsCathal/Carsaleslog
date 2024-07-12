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
end
