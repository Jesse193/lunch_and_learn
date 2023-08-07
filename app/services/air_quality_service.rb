class AirQualityService
  def conn
    Faraday.new(url: "https://api.api-ninjas.com") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["air_quality"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def air_quality(city)
    get_url("/v1/airquality?city=#{city}")
  end
end