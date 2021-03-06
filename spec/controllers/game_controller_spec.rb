require 'rails_helper'

RSpec.describe GameController, type: :controller do
  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "GET game/page1" do
    it "responds with 200" do
      allow_any_instance_of(GameController).to receive(:autosave).and_return(true)
      get "page1"
      expect(response).to have_http_status(200)
    end
  end
end