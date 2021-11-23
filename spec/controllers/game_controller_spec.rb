require 'rails_helper'

RSpec.describe GameController, type: :controller do
  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "GET game/page-1" do
    it "responds with 200" do
      get "page-1"
      expect(response).to have_http_status(200)
    end
  end
end