module Api::V1
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :destroy, :update]

    def index
      posts = Post.all
      render json: posts, each_serializer: PostSerializer, status: :ok
    end

    def create
      post = Post.new(post_params)

      if post.save
        render json: { msg: "Post created", post_id: post.id, success: true}, status: :created
      else
        render json: { msg: "Error", success: false }, status: :unprocessable_entity
      end
    end

    def show
      render json: @post, status: :ok
    end

    def update
      if @post.update(post_params)
        render json: { msg: "Post updated", success: true}, status: :ok
      else
        render json: { msg: "Error", success: false}, status: :unprocessable_entity
      end
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :extract, :content)
    end
  end
end