require "rails_helper"

RSpec.describe "User registration request" do
  describe "User register request" do
    it "can request user registration" do
      post "/api/v1/users", params: {name: "User", email: "User@email.com", password: "1234", password_confirmation: "1234"}
      expect(response.status).to eq(200)
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data][:attributes]).to have_key(:api_key)
      expect(json[:data][:attributes]).to have_key(:name)
      expect(json[:data][:attributes][:name]).to eq("User")
      expect(json[:data][:attributes]).to have_key(:email)
      expect(json[:data][:attributes][:email]).to eq("User@email.com")
      expect(json[:data][:attributes]).to_not have_key(:dogs)
    end
  end
end