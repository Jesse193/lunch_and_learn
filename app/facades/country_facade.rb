class CountryFacade
  def country(name)
    service.country(name).map do |data|
      Country.new(data)
    end
  end

  def service
    service = CountryService.new
  end
end