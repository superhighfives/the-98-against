# app.rb
require 'compass'
require 'sinatra'
require 'sinatra/activerecord'
require './db/models'
require 'haml'
require 'sass'
require 'maruku'

set :database, 'sqlite3:///the98against.db'

configure do
  Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.rb'))
end

get '/' do
  @politicians = Politician.all
  haml :index
end

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"stylesheets/#{params[:name]}", Compass.sass_engine_options)
end