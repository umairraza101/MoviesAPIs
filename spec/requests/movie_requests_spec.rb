require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'Movies', type: :request do
  before(:each) do
    @user = build(:user)
    @user1 = FactoryBot.build(:user, email: 'bot@example.com')
    @movie = FactoryBot.create(:movie, name: 'bot', rating: 4)
    @movie_catalog = FactoryBot.build(:movie_catalog, price: 300)
  end

  describe 'User SignIn' do
    path '/api/v1/auth/sign_in' do
      post 'Sign in user' do
        tags 'Session'
        produces 'application/json', 'application/xml'
        parameter name: :email, :in => :query, :type => :string
        parameter name: :password, :in => :query, :type => :string
        response '201', 'User signed In' do
          schema type: :object,
                 properties: {
                   email: { type: :string },
                   password: { type: :string }
                 },
                 required: ['email', 'password']
          # let(:user) { { email: 'test3@gmail.com', password: 'password' } }
          # let(:user) { { user: { email: 'test3@gmail.com', password: 'password' } } }
          run_test!
        end
      end
    end
  end

  describe 'User SignUp' do
    path '/api/v1/auth' do
      post 'Sign Up user' do
        tags 'Session'
        produces 'application/json', 'application/xml'
        parameter name: :email, :in => :query, :type => :string
        parameter name: :password, :in => :query, :type => :string
        parameter name: :password_confirmation, :in => :query, :type => :string
        parameter name: :role, :in => :query, :type => :integer

        response '201', 'User signed Up' do
          schema type: :object,
                 properties: {
                   email: { type: :string },
                   password: { type: :string },
                   password_confirmation: { type: :string },
                   role: { type: :integer }
                 },
                 required: ['email', 'password', 'password_confirmation']
          run_test!
        end
      end
    end
  end

  describe 'Movie Catalog API' do

    path '/api/v1/movie_catalogs' do
      get 'get movie catalog' do
        response '200', 'movie catalog' do
          run_test!
        end
      end

      post 'create movie catalog' do
        produces 'application/json', 'application/xml'
        parameter name: :movie_id, in: :formdata, :type => :integer
        parameter name: "movie_catalog[time]", in: :formdata, :type => :datetime
        parameter name: "movie_catalog[price]", in: :formdata, :type => :decimal
        response '201', 'movie catalog created' do
          schema type: :object,
                 properties: {
                   movie_catalog: { movie_id: { type: :integer } },
                   movie_catalog: { time:
                                      { type: :datetime }
                   },
                   movie_catalog: { price:
                                      { type: :decimal } }
                 },
                 required: ['movie_id']
          # let(:movie_catalog) { { movie_id: 2 } }
          run_test!
        end

        response '422', 'invalid request' do
          let(:movie_catalog) {}
          run_test!
        end
      end
    end

    path '/api/v1/movie_catalogs/{id}' do
      put 'update movie catalog' do
        produces 'application/json', 'application/xml'
        parameter name: :id, :in => :path, :type => :integer
        parameter name: "movie_catalog[time]", in: :formdata, :type => :datetime
        parameter name: "movie_catalog[price]", in: :formdata, :type => :decimal
        response '202', 'Movie Updated' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   movie_catalog: { time:
                                      { type: :datetime }
                   },
                   movie_catalog: { price:
                                      { type: :decimal } }

                 },
                 required: ['id']

          let(:id) { MovieCatalog.update.id }
          run_test!
        end
        response '404', 'movie not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end

      delete 'Delete movie' do
        produces 'application/json', 'application/xml'
        parameter name: :id, :in => :path, :type => :integer
        response '202', 'Movie Deleted' do
          schema type: :object,
                 properties: {
                   id: { type: :integer }
                 },
                 required: ['id']

          let(:id) { MovieCatalog.destroy.id }
          run_test!
        end
        response '404', 'movie not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end
  end

  describe 'Fetch Movies API' do
    path '/api/v1/movies/fetch_movies' do
      get 'get all movies' do
        response '200', 'fetch movies' do
          run_test!
        end
      end
    end
  end

  describe 'Movie API' do
    path '/api/v1/movies/{id}' do
      get 'get movie' do
        produces 'application/json', 'application/xml'
        parameter name: :id, :in => :path, :type => :string
        response '200', 'movie' do
          schema type: :object,
                 properties: {
                   id: { type: :integer }
                 },
                 required: ['id']
          run_test!
        end
      end
    end

    path '/api/v1/movies/{id}/rating' do
      post 'get movie rating' do
        produces 'application/json', 'application/xml'
        parameter name: :id, :in => :path, :type => :string
        response '200', 'movie' do
          schema type: :object,
                 properties: {
                   id: { type: :integer }
                 },
                 required: ['id']
          run_test!
        end
      end
    end
  end

end
