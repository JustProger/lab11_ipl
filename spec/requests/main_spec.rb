require 'rails_helper'

RSpec.describe "Mains", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/main/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/main/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /result" do
    it "returns http success" do
      get "/main/result"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /all" do
    it "returns http success" do
      get "/main/all"
      expect(response).to have_http_status(:success)
    end
  end

end
