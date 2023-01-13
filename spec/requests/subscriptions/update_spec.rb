require 'rails_helper'

RSpec.describe "subscriptions#update", type: :request do 
  describe "patch /update" do
    let(:customer) { create(:customer) }
    let(:tea) { create(:tea) }
    let(:subscription) { create(:subscription, customer_id: customer.id, tea_id: tea.id, status: :active) }

    let(:valid_params) do 
      {
        subscription_id: subscription.id,
        status: :cancelled
      }
    end

    it 'has successful response' do
      patch api_v1_update_path
      expect(response).to have_http_status(:success)
    end

    it 'updates subscription status to cancelled' do
      patch patch api_v1_update_path, params: valid_params
    end
  end
end