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

    end
  end
end