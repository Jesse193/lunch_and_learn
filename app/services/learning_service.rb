class LearningService
  def conn
    Faraday.new(url: "https://youtube.googleapis.com/youtube/v3/search?")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def videos(country)
    get_url("part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&key=#{Figaro.env.key}&q=#{country}")
  end
end

