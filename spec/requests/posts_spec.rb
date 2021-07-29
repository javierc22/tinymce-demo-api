require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /api/v1/posts" do
    context "when there are not posts" do
      before :each do
        get "/api/v1/posts"
        @payload = JSON.parse(response.body)
      end

      it "should return 0 posts" do
        expect(@payload).to be_empty
      end

      it "should respond with status 200 (ok)" do
        expect(@response).to have_http_status(:ok)
      end
    end

    context "when there are posts" do
      let!(:posts) { create_list(:post, 10) }

      before :each do
        get "/api/v1/posts"
        @payload = JSON.parse(response.body)
      end

      it "should return posts" do
        expect(@payload.size).to eq(posts.size)
      end

      it "should respond with status 200 (ok)" do
        expect(@response).to have_http_status(:ok)
      end
    end
  end
end
