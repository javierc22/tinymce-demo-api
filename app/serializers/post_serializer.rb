class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :extract, :created_at
  attribute :breadcrumbs, if: -> { is_edit? }

  def breadcrumbs
    [
      { to: "/", text: "Inicio", is_active: false },
      { to: "/#{object.id}", text: object.title, is_active: false },
      { to: "", text: "Editar", is_active: true },
    ]
  end

  def created_at
    object.get_format_created_at
  end

  def is_edit?
    instance_options[:is_edit]
  end
end