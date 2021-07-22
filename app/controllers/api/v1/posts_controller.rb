module Api::V1
  class PostsController < ApplicationController
    def index
      render json: { message: "Hola" }, status: :ok
    end
  end
end