class PhotoService
  def conn
    Faraday.new(url: "https://api.unsplash.com/")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def photos(country)
    get_url("/search/photos?page=1&query=#{country}&order_by=relevant&content_filter=high&client_id=#{Figaro.env.unsplash_access}")
  end
end

