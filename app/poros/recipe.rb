class Recipe
  attr_reader :title, :url, :country, :image, :id
  def initialize(attributes)
    @title = attributes[:recipe][:label]
    @url = attributes[:recipe][:url]
    @country = attributes[:recipe][:cuisineType]
    @image = attributes[:recipe][:image]
    @id = "null"
  end
end