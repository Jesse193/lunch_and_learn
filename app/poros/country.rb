class Country
  attr_reader :name, :capital, :demonym
  def initialize(attributes)
    @name = attributes[:name][:official]

    if attributes[:capital].present?
      @capital = attributes[:capital][0]
    elsif attributes[:capital].present? && attributes[:capital].count != 1
      @capital = attributes[:capital]
    else
      @capital = "Not available"
    end
    if attributes[:demonyms].present?
      if attributes[:demonyms][:eng].present?
        @demonym = attributes[:demonyms][:eng][:m]
      end
    else
      @demonym = ""
    end
  end
end