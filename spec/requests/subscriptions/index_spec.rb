require 'rails_helper'

RSpec.describe "subscriptions#index", type: :request do 
  describe "get /index" do
    let(:customer) { create(:customer) }
    let(:tea_1) { create(:tea) }
    let(:tea_2) { create(:tea) }

    let(:customer_params) do 
      {
        customer_id: customer.id,
      }
    end

    it 'renders json for customer subscriptions' do
      create(:subscription, customer_id: customer.id, tea_id: tea_1.id, status: :active)
      create(:subscription, customer_id: customer.id, tea_id: tea_2.id, status: :active)

      get  api_v1_index_path, params: customer_params

      expect(response).to have_http_status(:success)

      index = JSON.parse(response.body, symbolize_names: true)

      expect(index).to be_a(Hash)
      expect(index).to have_key(:data)
      expect(index[:data]).to be_a(Hash)
      expect(index[:data][:customer_id]).to eq(customer.id)
      expect(index[:data][:subscriptions]).to be_a(Array)
      index[:data][:subscriptions].each do |subscription|
        expect(subscription).to be_a(Hash)
        expect(subscription).to have_key(:attributes)
      end
    end
  end
end