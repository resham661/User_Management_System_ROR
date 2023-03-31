require 'swagger_helper'

RSpec.describe 'users', type: :request do

  path '/users' do

    get('list users') do
      tags 'User'
      
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create user') do
      tags 'User'

      response(200, 'successful') do

        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            full_name: { type: :string },
            email: { type: :string },
            username: { type: :string },
            password: { type: :string }
          },
          required: %w[ full_name username email password ]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/users/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show user') do
      tags 'User'

      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('edit user') do
      tags 'User'

      response(200, 'successful') do
        let(:id) { '123' }

        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            full_name: { type: :string },
            email: { type: :string },
            username: { type: :string },
            password: { type: :string }
          },
          required: %w[ full_name username email password ]
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete user') do
      tags 'User'

      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/users/deactive/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    put('deactive user') do
      tags 'User'

      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/users/{user_id}/roles/{role_id}' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'role_id', in: :path, type: :string, description: 'role_id'

    post('role_assign user') do
      tags 'User_Role'

      response(200, 'successful') do
        let(:user_id) { '123' }
        let(:role_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('remove_role user') do
      tags 'User_Role'

      response(200, 'successful') do
        let(:user_id) { '123' }
        let(:role_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
