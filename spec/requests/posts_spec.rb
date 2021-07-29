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

  describe "GET /api/v1/posts/:id" do
    context "when parameter :id does not exist" do
      before :each do
        get "/api/v1/posts/100"
        @payload = JSON.parse(response.body)
      end

      it "should return error message" do
        expect(@payload["msg"]).to eq("Not found")
      end

      it "should respond with status 404 (not_found)" do
        expect(@response).to have_http_status(:not_found)
      end
    end

    context "when parameter :id does exist" do
      let(:post) { create(:post) }

      before :each do
        get "/api/v1/posts/#{post.id}"
        @payload = JSON.parse(response.body)
      end

      it "should return post" do
        expect(@payload["id"]).to eq(post.id)
        expect(@payload["title"]).to eq(post.title)
        expect(@payload["extract"]).to eq(post.extract)
        expect(@payload["content"]).to eq(post.content)
        expect(@payload).not_to be_empty
      end

      it "should respond with status 200 (ok)" do
        expect(@response).to have_http_status(:ok)
      end
    end
  end
end
