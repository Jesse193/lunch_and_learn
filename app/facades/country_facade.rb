class CountryFacade
  def country(name)
    country = service.country(name).first
    if country != [:status, 404]
      Country.new(country)
    else
      raise "Error: status: 400"
    end
  end

  def random_country
    countries = service.random_country
    random = countries.sample(1).first
    Country.new(random)
  end

  def service
    service = CountryService.new
  end
end