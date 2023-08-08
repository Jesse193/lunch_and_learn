class RecipeService
  def conn
    Faraday.new(url: "https://api.edamam.com/api/recipes/v2")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def recipes(demonym, country)
    get_url("?type=public&app_id=#{Figaro.env.app_id}&app_key=#{Figaro.env.app_key}&cuisineType=#{demonym}&q=#{country}")
  end
end