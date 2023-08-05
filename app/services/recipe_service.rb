class RecipeService
  def conn
    Faraday.new(url: "https://api.edamam.com/api/recipes/v2")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def recipes(country)
    get_url("?type=public&app_id=#{Figaro.env.app_id}&api_key=#{Figaro.env.app_key}&cuisineType=#{country}")
  end
end