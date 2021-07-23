class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :extract
end
