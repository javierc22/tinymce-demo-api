require 'rails_helper'

RSpec.describe Post, type: :model do
  it "validate presence of title" do
    should validate_presence_of(:title)
  end
end
