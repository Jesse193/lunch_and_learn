class CountryFacade
  def country(name)
    Country.new(service.country(name).first)
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