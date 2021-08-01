require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do

  let(:valid_attributes) do
    {
      title: "Post 1",
      content: "content post 1",
    }
  end

  let(:invalid_attributes) do
    {
      title: nil,
      content: "content de Terror"
    }
  end

  describe "GET #index" do
    it "returns a success response" do
      Post.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      post = Post.create! valid_attributes
      get :show, params: {id: post.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
      end

      it "renders a JSON response with the new post" do
        post :create, params: {post: valid_attributes}
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new category" do
        post :create, params: {post: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        {
          title: "Post updated",
          content: "content updated"
        }
      end

      it "updates the requested post" do
        post = Post.create! valid_attributes
        put :update, params: {id: post.to_param, post: new_attributes}
        post.reload
        expect(post.title).to eq "Post updated"
      end

      it "renders a JSON response with the post" do
        post = Post.create! valid_attributes

        put :update, params: {id: post.to_param, post: valid_attributes}
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the post" do
        post = Post.create! valid_attributes

        put :update, params: {id: post.to_param, post: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested post" do
      post = Post.create! valid_attributes
      expect {
        delete :destroy, params: {id: post.to_param}
      }.to change(Post, :count).by(-1)
    end
  end
end