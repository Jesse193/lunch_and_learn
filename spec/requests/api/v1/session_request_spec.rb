require "rails_helper"

RSpec.describe "User can login" do
  describe "user login" do
    it "can log in" do
      post "/api/v1/users", params: {name: "User", email: "User@email.com", password: "1234", password_confirmation: "1234"}
      post "/api/v1/sessions", params: {email: "User@email.com", password: "1234"}
      expect(response.status).to eq(200)
      expect(response.body).to eq("{\"Success\":\"Successfully logged in\"}")
    end
  end

  describe "cannot login if bad crederntials" do
    it "cannot login" do
      post "/api/v1/users", params: {name: "Use2r", email: "User2@email.com", password: "1234", password_confirmation: "1234"}
      expect{post "/api/v1/sessions", params: {email: "User2@email.com", password: "1"}}.to raise_error("Error: Email and password must be valid")
    end
  end
end