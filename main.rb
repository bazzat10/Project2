require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'active_record'
require_relative 'database_config'
require_relative 'models/user'
require_relative 'models/comment'
require_relative 'models/book'



enable :sessions

get '/' do
  erb :index
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password]) # authenticates both useremail and user password
    session[:user_name] = user.name
    # session = {
    #   :user_name => barry}
    # }
    redirect "/all_books"
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
  @books = Book.all
  # conn = PG.connect(dbname: 'online_bookstore')
  # sql = "SELECT * FROM books;"
  # @books = conn.exec(sql)
  # conn.close
  erb :all_books
end

get '/about_book' do
  @book = Book.find_by(book_title: params[:title])
  book_id = @book.id
  @comments = Comment.where(book_id: book_id)
  # conn = PG.connect(dbname: 'online_bookstore')
  # sql = "SELECT * FROM books WHERE book_title = '#{params[:title]}';"
  # @book = conn.exec(sql)[0]
  # sql = "SELECT * FROM comments;"
  # @comments = conn.exec(sql)
  # conn.close
  # binding.pry
  erb :about_book
end


post 'create_comment' do
  erb: create_comment
end
post '/end_session' do
  session[:user_name] = nil
   redirect '/'
end
