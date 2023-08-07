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

    it "returns error if user registration fails" do
      expect{post "/api/v1/users", params: {name: "User", email: "User@email.com", password: "1234", password_confirmation: "1"}}.to raise_error("Validation failed: Password confirmation doesn't match Password")
    end

    it "only requires unique email" do
      post "/api/v1/users", params: {name: "User", email: "User@email.com", password: "1234", password_confirmation: "1234"}
      expect{post "/api/v1/users", params: {name: "User", email: "User@email.com", password: "1234", password_confirmation: "1234"}}.to raise_error("Validation failed: Email has already been taken")
    end
  end

  describe "User favorites" do
    it "can add favorite" do
      post "/api/v1/users", params: {name: "User2", email: "User2@email.com", password: "1234", password_confirmation: "1234"}
      user = JSON.parse(response.body, symbolize_names: true)
      query_params = {country: "USA", recipe_link: "http://www.seriouseats.com/recipes/2016/08/iced-matcha-green-tea-recipe.html", recipe_title: "Frothy Iced Matcha Green Tea Recipe", api_key: user[:data][:attributes][:api_key]}
      post api_v1_favorites_path, params: query_params
      message = JSON.parse(response.body, symbolize_names: true)
      expect(message).to eq({
        "Success": "Favorite added successfully"
      })
    end

    it "can get favorites" do
      post "/api/v1/users", params: {name: "User2", email: "User2@email.com", password: "1234", password_confirmation: "1234"}
      user = JSON.parse(response.body, symbolize_names: true)
      query_params = {country: "USA", recipe_link: "http://www.seriouseats.com/recipes/2016/08/iced-matcha-green-tea-recipe.html", recipe_title: "Frothy Iced Matcha Green Tea Recipe", api_key: user[:data][:attributes][:api_key]}
      post api_v1_favorites_path, params: query_params
      
      query_params = {api_key: user[:data][:attributes][:api_key]}
      get api_v1_favorites_path, params: query_params
      favorites = JSON.parse(response.body, symbolize_names: true)
      expect(favorites[:data][0]).to have_key(:id)
      expect(favorites[:data][0]).to have_key(:type)
      expect(favorites[:data][0][:type]).to eq("favorite")
      expect(favorites[:data][0]).to have_key(:attributes)
      expect(favorites[:data][0][:attributes]).to have_key(:recipe_link)
      expect(favorites[:data][0][:attributes][:recipe_link]).to eq("http://www.seriouseats.com/recipes/2016/08/iced-matcha-green-tea-recipe.html")
      expect(favorites[:data][0][:attributes]).to have_key(:recipe_title)
      expect(favorites[:data][0][:attributes][:recipe_title]).to eq("Frothy Iced Matcha Green Tea Recipe")
      expect(favorites[:data][0][:attributes]).to have_key(:country)
      expect(favorites[:data][0][:attributes][:country]).to eq("USA")
      expect(favorites[:data][0][:attributes]).to have_key(:created_at)
      expect(favorites[:data][0][:attributes]).to_not have_key(:puppies)
      expect(favorites[:data][0]).to_not have_key(:kittens)
    end
  end
end