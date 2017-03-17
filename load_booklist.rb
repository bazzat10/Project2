require 'sinatra'
require 'pry'
# require 'sinatra/reloader'
require 'pg'


# db_conn = PG.connect(:dbname => 'online_bookstore')

db_conn =

file = File.new("booklist.csv", "a+")

file.each do |line|
  book = line.split(",")
  author = book[0]
  about_author = book[1]
  book_title = book[2]
  images= book[3]
  plot = book[4]
  year_level = book[5].chomp
  price = book[6]

  sql  = "INSERT INTO books (author, about_author, book_title, images, plot, year_level, price)"
  sql += "VALUES ('#{author}', '#{about_author}', '#{book_title}', '#{images}', '#{plot}', '#{year_level}', '#{price}');"

  db_conn.exec(sql)

end

file.close

db_conn.close
