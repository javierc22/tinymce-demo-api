class Post < ApplicationRecord
  validates :title, presence: true

  def get_format_created_at
    I18n.l(self.created_at, format: :long).capitalize
  end
end
