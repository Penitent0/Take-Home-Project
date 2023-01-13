require 'rails_helper'

RSpec.describe "subscriptions#create", type: :request do
  describe "post /create" do
    let(:customer) { create(:customer) }
    let(:tea) { create(:tea) }

    let(:tea_params) do 
      {
        customer_id: customer.id,
        tea_id: tea.id,
        title: "new subscription",
        price: 10.99,
        status: :active,
        frequency: :monthly
      }
    end

    let(:invalid_params) do 
      {
        price: 20.49,
        status: :active,
        frequency: :weekly
      }
    end

    it 'can create new subscriptions' do
      post api_v1_create_path, params: tea_params

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

    it 'returns errors if params are invalid' do
      post api_v1_create_path, params: invalid_params

      expect(response).to have_http_status(:bad_request)

      errors = JSON.parse(response.body, symbolize_names: true)
      expect(errors).to be_a(Hash)
      expect(errors).to have_key(:error)
      expect(errors[:error]).to be_a(Array)
      errors[:error].each do |message|
        expect(message).to be_a(Hash)
        expect(message[:message]).to be_a(String)
      end
    end
  end
end