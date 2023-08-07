class CountryFacade
  def country(name)
    Country.new(service.country(name).first)
  end

  def service
    service = CountryService.new
  end
end