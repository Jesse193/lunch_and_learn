class RecipeSerializer
  include JSONAPI::Serializer
  set_id :id
  set_type :recipe
  attributes :title, :url, :image
  attributes :country do |recipe, params|
    params[:country]
  end
end