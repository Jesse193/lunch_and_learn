class Learn
  attr_reader :title, :youtube_video_id, :id, :video
  def initialize(attributes)
    @title = attributes[:snippet][:title]
    @youtube_video_id = attributes[:id][:videoId]
    @id = "null"
    @video = {title: @title, youtube_video_id: @youtube_video_id}
  end
end