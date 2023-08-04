class CountryService
  def conn
    Faraday.new(url: "https://restcountries.com/v3.1") do |f|
      f.headers[] = ENV["countries_api_key"]
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def country(name)
    get_url("/name/#{name}")
  end
end