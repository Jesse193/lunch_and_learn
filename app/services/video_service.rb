class VideoService
  def conn
    Faraday.new(url: "https://youtube.googleapis.com/youtube/v3/search")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def video(country)
    get_url("?&channelId=UCluQ5yInbeAkkeCndNnUhpw&key=#{Figaro.env.key}&q=#{country}&type=video&part=snippet")
  end
end
