require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    binding.pry
    @article = Article.create()

    redirect '/articles/:id'
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end

end
