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
        expect(@payload["message"]).to eq("Not found")
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

  describe "GET /api/v1/posts/:id/edit" do
    context "when parameter :id does not exist" do
      before :each do
        get "/api/v1/posts/100/edit"
        @payload = JSON.parse(response.body)
      end

      it "should return error message" do
        expect(@payload["message"]).to eq("Not found")
      end

      it "should respond with status 404 (not_found)" do
        expect(@response).to have_http_status(:not_found)
      end
    end

    context "when parameter :id does exist" do
      let(:post) { create(:post) }

      before :each do
        get "/api/v1/posts/#{post.id}/edit"
        @payload = JSON.parse(response.body)
      end

      it "should return post to edit" do
        expect(@payload["id"]).to eq(post.id)
        expect(@payload["title"]).to eq(post.title)
        expect(@payload["extract"]).to eq(post.extract)
        expect(@payload["content"]).to eq(post.content)
        expect(@payload["breadcrumbs"]).to be_present
      end

      it "should respond with status 200 (ok)" do
        expect(@response).to have_http_status(:ok)
      end
    end
  end

  describe "POST /api/v1/posts" do
    context "when post is successfully created with valid params" do
      let(:valid_params) do 
        { 
          post: { title: "Post test", extract: "Hi I am extract", content: "Hi I am description" }
        }
      end

      before :each do
        post "/api/v1/posts", params: valid_params
        @payload = JSON.parse(response.body)
      end

      it "should create new post" do
        expect(@payload["post_id"]).to be_present
        expect(Post.find(@payload["post_id"])).not_to be_nil
        expect(Post.find(@payload["post_id"]).title).to eq(valid_params[:post][:title])
      end

      it "should return successful message" do
        expect(@payload["message"]).to eq("Post created")
        expect(@payload["success"]).to be true
      end
        
      it "should respond with status 201 (created)" do
        expect(response).to have_http_status(:created)
      end
    end

    context "when request have invalid params" do
      let(:invalid_params) do 
        { 
          post: { title: "", extract: "Hi I am extract", content: "Hi I am description" }
        }
      end

      before :each do
        post "/api/v1/posts", params: invalid_params
        @payload = JSON.parse(response.body)
      end

      it "should return error message" do
        expect( @payload["message"]).to eq("Error")
        expect(@payload["success"]).to be false
      end
    end

    context "when not params present" do
      before :each do
        post "/api/v1/posts", params: {}
        @payload = JSON.parse(response.body)
      end
  
      it "should return message error" do
        expect(@payload["message"]).to eq("Error")
      end
  
      it "should respond with status 400 (bad_request)" do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "DELETE /api/v1/posts/:id" do
    context "when is successfully deleted" do
      let!(:posts) { create_list(:post, 5) }

      before :each do
        delete "/api/v1/posts/#{posts[0].id}"
        @payload = JSON.parse(response.body)
      end

      it "should delete request post" do
        expect(Post.all).to_not include(posts[0])
        expect(Post.count).to eq(posts.size - 1)  
      end

      it "should return successful message" do
        expect(@payload["message"]).to eq("Post deleted")
        expect(@payload["success"]).to eq(true)
      end
        
      it "should respond with status 200 (ok)" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "when :id does not exist" do
      let!(:posts) { create_list(:post, 5) }

      before :each do
        delete "/api/v1/posts/100"
        @payload = JSON.parse(response.body)
      end

      it "should not delete requested post" do
        expect(Post.count).to eq(posts.size)
      end

      it "should return error message" do
        expect( @payload["message"]).to eq("Not found")
      end

      it "should respond with status 404 (not_found)" do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "PUT /api/v1/posts/:id" do
    context "when is successfully updated" do
      let(:post) { create(:post, title: "Post test 1") }

      let(:valid_params) do 
        { 
          post: { title: "Post test 1 updated", extract: "extract updated", content: "description updated" }
        }
      end

      before :each do
        put "/api/v1/posts/#{post.id}", params: valid_params
        @payload = JSON.parse(response.body)
      end

      it "should updated request post" do
        post_updated = Post.find(post.id)
        expect(post_updated.title).to eq(valid_params[:post][:title])
        expect(post_updated.extract).to eq(valid_params[:post][:extract])
        expect(post_updated.content).to eq(valid_params[:post][:content])
      end

      it "should return successful message" do
        expect(@payload["message"]).to eq("Post updated")
        expect(@payload["success"]).to eq(true)
      end
        
      it "should respond with status 200 (ok)" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "when there is invalid params" do
      let(:post) { create(:post, title: "Post test 1") }

      let(:invalid_params) do 
        { 
          post: { title: nil, extract: nil, content: nil }
        }
      end

      before :each do
        put "/api/v1/posts/#{post.id}", params: invalid_params
        @payload = JSON.parse(response.body)
      end

      it "should return message error" do
        expect(@payload["message"]).to eq("Error")
        expect(@payload["success"]).to eq(false)
      end
    end

    context "when post not found" do
      before :each do
        put "/api/v1/posts/100"
        @payload = JSON.parse(response.body)
      end

      it "should return error message" do
        expect( @payload["message"]).to eq("Not found")
      end

      it "should respond with status 404 (not_found)" do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
