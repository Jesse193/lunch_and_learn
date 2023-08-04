class CountryFacade
  def country(name)
    service.country(name)
  end

  def service
    service = CountryService.new
  end
end