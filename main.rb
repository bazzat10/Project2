require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'

get '/' do
  conn = PG.connect(dbname: 'online_bookstore')
  sql = "SELECT * FROM books;"
  @books = conn.exec(sql)
  erb :index
end

get '/about_book' do
  conn = PG.connect(dbname: 'online_bookstore')
  sql = "SELECT * FROM books WHERE book_title = '#{params[:title]}';"
  @book = conn.exec(sql)[0]
  erb :about_book
end
