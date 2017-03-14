require 'sinatra'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'


db_conn = PG.connect(:dbname => 'online_bookstore')

file = File.new("booklist.csv", "a+")

file.each do |line|
  book = line.split(",")
  author = book[0]
  about_author = book[1] #.gsub("'","''")
  book_title = book[2] #.gsub("'","''")
  images= book[3] #.gsub("'","''")
  plot = book[4] #.gsub("'","''")
  year_level = book[5].chomp

  sql  = "INSERT INTO books (author, about_author, book_title, images, plot, year_level)"
  sql += "VALUES ( '#{author}', '#{about_author}', '#{book_title}', '#{images}', '#{plot}', '#{year_level}');"

  db_conn.exec(sql)

end

file.close

db_conn.close
