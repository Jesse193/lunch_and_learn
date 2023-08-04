class CountryService
  def conn
    Faraday.new(url: "https://restcountries.com/v3.1/")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def country(name)
    get_url("name/#{name}")
  end
end