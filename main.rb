require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'active_record'
require_relative 'database_config'
require_relative 'models/user'


get '/' do
  erb :index
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    redirect '/all_books'
  else
    erb :index
  end
end

get '/create_user' do
  erb :create_user
end

post '/new_user' do
  user = User.new
  user.name = params[:name]
  user.surname = params[:surname]
  user.email = params[:email]
  user.phone_no = params[:phone_no]
  user.street_no = params[:street_no]
  user.street_name = params[:street_name]
  user.suburb = params[:suburb]
  user.postcode = params[:postcode]
  user.password = params[:password]
  user.save
  erb :index
end

get '/all_books' do
  conn = PG.connect(dbname: 'online_bookstore')
  sql = "SELECT * FROM books;"
  @books = conn.exec(sql)
  conn.close
  erb :all_books
end

get '/about_book' do
  conn = PG.connect(dbname: 'online_bookstore')
  sql = "SELECT * FROM books WHERE book_title = '#{params[:title]}';"
  @book = conn.exec(sql)[0]
  conn.close
  erb :about_book
end
