require 'rails_helper'

RSpec.describe "subscriptions#update", type: :request do 
  describe "patch /update" do
    it 'has successful response' do
      patch api_v1_update_path
      expect(response).to have_http_status(:success)
    end
  end
end