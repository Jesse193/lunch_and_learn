class LearningSerializer
  include JSONAPI::Serializer
  :data
  set_id :id
  set_type :learning_resource
  attributes 
  
  attribute :country do |learning, params|
    params[:country]
  end
  attribute :video
end