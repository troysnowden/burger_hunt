require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET /register " do
    it "responds with 200" do
      get :register
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /register" do
    it "creates a user" do
      post :create, params: { user: { username: "jsmith", password: "pass" } }
      expect(response).to redirect_to("/game/page-1")
      expect(User.find_by(username: "jsmith").class).to eq(User)
    end
  end

  describe "GET /login" do
    it "responds with 200" do
      get :login
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /login" do
    it "responds with 200" do
      post :create, params: { user: { username: "jsmith", password: "pass" } }
      post :authenticate, params: { username: "jsmith", password: "pass" }
      expect(response).to redirect_to("/game/home")
    end
  end

  describe "GET /logout" do
    it "responds with 200" do
      get :logout
      expect(response).to redirect_to("/login")
    end
  end
end