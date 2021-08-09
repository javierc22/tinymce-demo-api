require 'swagger_helper'

describe 'Tinymce demo API' do
  path '/api/v1/posts' do
    get 'Return list of posts' do
      tags 'Posts'
      description 'Return a list of posts'
      produces 'application/json'
      response '200', 'List of posts' do
        run_test!
        schema type: 'array', items: { '$ref' => '#/components/schemas/post' }
      end
    end
  end

  path '/api/v1/posts/{id}' do
    get 'Return a post' do
      tags 'Posts'
      description 'Return a single post'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, required: true

      response '200', 'post found' do
        let(:id) { create(:post).id }
        run_test!
        schema '$ref' => '#/components/schemas/post'
      end

      response '404', 'Not found' do
        let(:id) { 'invalid' }
        run_test!
        schema '$ref' => '#/components/schemas/not_found'
      end
    end
  end

  path '/api/v1/posts/{id}/edit' do
    get 'Return a post' do
      tags 'Posts'
      description 'Return a single post'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, required: true

      response '200', 'post found' do
        let(:id) { create(:post).id }
        run_test!
        schema '$ref' => '#/components/schemas/edit_post'
      end

      response '404', 'Not found' do
        let(:id) { 'invalid' }
        run_test!
        schema '$ref' => '#/components/schemas/not_found'
      end
    end
  end

  path '/api/v1/posts' do
    post 'Create a post' do
      tags 'Posts'
      description 'Create a post'
      consumes 'application/json'
      parameter name: :post_item, in: :body, schema: { '$ref' => '#/components/schemas/new_post' }

      response '201', 'Post created' do
        let!(:post_item) { { title: 'Post 1', content: 'content post' } }
        run_test!
        examples 'application/json' => {
          message: "Post created", post_id: 1, success: true
        }
      end

      response '422', 'invalid request' do
        let!(:post_item) { { title: '', content: '' } }
        run_test!
        examples 'application/json' => {
          message: "Error", success: false
        }
      end

      response '400', 'Bad request' do
        let(:post_item) { 'invalid' }
        run_test!
        examples 'application/json' => {
          message: "Error"
        }
      end
    end
  end

  path '/api/v1/posts/{id}' do
    put 'update a post' do
      tags 'Posts'
      description 'Update a single post'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer, required: true
      parameter name: :post_item, in: :body, schema: { '$ref' => '#/components/schemas/new_post' }

      response '200', 'post updated' do
        let(:id) { create(:post).id }
        let!(:post_item) { { title: 'Post 1 updated', content: 'content post updated' } }
        run_test!
        examples 'application/json' => {
          message: "Post updated", success: true
        }
      end

      response '404', 'Not found' do
        let(:id) { 'invalid' }
        let!(:post_item) { { title: 'Post 1 updated', content: 'content post updated' } }
        run_test!
        examples 'application/json' => {
          message: "Not found"
        }
      end
    end
  end


  path '/api/v1/posts/{id}' do
    delete 'Delete a post' do
      tags 'Posts'
      description 'Delete a single post'
      consumes 'application/json'
      # produces 'application/json'
      parameter name: :id, in: :path, type: :integer, required: true

      response '200', 'post deleted' do
        let(:id) { create(:post).id }
        run_test!
        examples 'application/json' => {
          message: "Post deleted", success: true
        }
      end

      response '404', 'Not found' do
        let(:id) { 'invalid' }
        run_test!
        examples 'application/json' => {
          message: "Not found"
        }
      end
    end
  end
end