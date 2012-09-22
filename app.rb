# app.rb
require 'compass'
require 'sinatra'
require 'sinatra/activerecord'
require './db/models'
require 'haml'
require 'sass'
require 'maruku'
require 'uri'

configure :development, :test do
  set :database, 'sqlite3:///the98against.db'
end

configure :production do
  # Database connection
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/the98against')

  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

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