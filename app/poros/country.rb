class Country
  attr_reader :name, :capital, :demonym
  def initialize(attributes)
    @name = attributes[:name][:official]
    @capital = attributes[:capital][0]
    @demonym = attributes[:demonyms][:eng][:m]
  end
end