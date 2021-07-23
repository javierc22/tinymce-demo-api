module Api::V1
  class PostsController < ApplicationController
    def index
      posts = Post.all
      render json: posts, each_serializer: PostSerializer, status: :ok
    end

    def create
      post = Post.new(post_params)

      if post.save
        render json: { msg: "Post created", success: true}, status: :created
      else
        render json: { msg: "Error", success: false}, status: :unprocessable_entity
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :extract, :content)
    end
  end
end