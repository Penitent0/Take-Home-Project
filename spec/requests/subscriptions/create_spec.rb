require 'rails_helper'

RSpec.describe "subscriptions#create", type: :request do
  describe "post /create" do
    let(:customer) { create(:customer) }
    let(:tea_1) { create(:tea) }
    let(:tea_2) { create(:tea) }

    let(:tea_1_params) do 
      {
        customer_id: customer.id,
        tea_id: tea_1.id,
        price: 10.99,
        status: :active,
        frequency: :monthly
      }
    end

    let(:tea_2_params) do 
      {
        customer_id: customer.id,
        tea_id: tea_2.id,
        price: 20.49,
        status: 0,
        frequency: 2
      }
    end

    it 'can create new subscriptions' do
      expect { post api_v1_create_path, params: tea_1_params }.to change(Subscription, :count).by(+1)
      expect(response).to have_http_status(:created)

      new_subscription = JSON.parse(response.body, symbolize_names: true)

      expect(new_subscription).to be_a(Hash)
      expect(new_subscription).to have_key(:data)
      expect(new_subscription[:data]).to be_a(Hash)
      expect(new_subscription[:data][:type]).to eq("Subscription")
      expect(new_subscription[:data][:attributes]).to be_a(Hash)
      expect(new_subscription[:data][:attributes][:title]).to be_a(String)
      expect(new_subscription[:data][:attributes][:price]).to be_a(String)
      expect(new_subscription[:data][:attributes][:status]).to be_a(String)
      expect(new_subscription[:data][:attributes][:frequency]).to be_a(String)
    end
  end
end