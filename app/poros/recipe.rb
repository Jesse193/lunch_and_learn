class Recipe
  attr_reader :name, :url, :country, :image
  def initialize(attributes)
    @name = attributes[:recipe][:label]
    @url = attributes[:recipe][:url]
    @country = attributes[:recipe][:cuisineType]
    @image = attributes[:recipe][:image]
  end
end