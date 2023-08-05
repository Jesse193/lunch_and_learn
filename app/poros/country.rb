class Country
  attr_reader :name, :capital, :subregion
  def initialize(attributes)
    @name = attributes[:name][:official]
    @capital = attributes[:capital]
    @subregion = attributes[:subregion]
  end
end