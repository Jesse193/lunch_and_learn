class CountryFacade
  def country(country)
    service.country(country)
  end

  def service
    service = CountryService.new
  end
end