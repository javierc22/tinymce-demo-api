FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Noticia #{n}" }
    extract { "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tortor augue" }
    content { "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tortor augue, ultrices in sem vitae, porttitor condimentum ante." }
  end
end