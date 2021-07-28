class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :extract, :created_at

  def created_at
    object.get_format_created_at
  end
end