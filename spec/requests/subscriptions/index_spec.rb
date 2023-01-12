require 'rails_helper'

RSpec.describe "subscriptions#index", type: :request do 
  describe "get /index" do
    it 'has successful response' do
      get api_v1_index_path
      expect(response).to have_http_status(:success)
    end
  end
end