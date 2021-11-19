require 'rails_helper'

RSpec.describe GameController, type: :controller do
  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /register" do
    it "responds with 200" do
      get :register
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /register" do
    it "redirects to home" do
      post :register_name, params: { name: "John" }
      expect(response).to redirect_to("/game/home")
    end
  end

  describe "Get /home" do
    it "responds with 200" do
      get :home
      expect(response).to have_http_status(200)
    end
  end
end