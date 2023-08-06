class Photo
  attr_reader :alt_tag, :url
  def initialize(attributes)
    @alt_tag = attributes[:description]
    @url = attributes[:urls][:regular]
  end
end