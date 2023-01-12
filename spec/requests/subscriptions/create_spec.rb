require 'rails_helper'

RSpec.describe "subscriptions#create", type: :request do 
  describe "post /create" do
    it 'has successful response' do
      post api_v1_create_path
      expect(response).to have_http_status(:success)
    end
  end
end