# spec/controllers/sales_controller_spec.rb
require 'rails_helper'

RSpec.describe SalesController, type: :controller do
  let(:salesperson) { Salesperson.create(firstName: 'Charlie', lastName: 'McCabe', salesNumber: 0) }
  let(:valid_attributes) do
    {
      carModel: 'Opel',
      salesDate: '01/12/2014',
      fuelType: 'Petrol',
      salesperson_id: salesperson.id
    }
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Sale' do
        expect do
          post :create, params: { sale: valid_attributes }
        end.to change(Sale, :count).by(1)
      end

      it "increments the salesperson's salesNumber" do
        expect do
          post :create, params: { sale: valid_attributes }
        end.to change { salesperson.reload.salesNumber }.by(1)
      end

      it 'redirects to the root path with a notice' do
        post :create, params: { sale: valid_attributes }
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Sale was successfully created')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Sale' do
        expect do
          post :create, params: { sale: { carModel: nil } }
        end.to change(Sale, :count).by(0)
      end

      it "renders the 'new' template with a notice" do
        post :create, params: { sale: { carModel: nil } }
        expect(response).to render_template('new')
        expect(flash[:notice]).to eq('There was an error')
      end
    end
  end
end
