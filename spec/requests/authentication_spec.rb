require 'swagger_helper'

RSpec.describe 'authentication', type: :request do

  path '/auth/login' do

    post('login authentication') do
      response(200, 'successful') do

        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            email: { type: :string },
            password: { type: :string}
          },
          required: %w[ email password]
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
end
