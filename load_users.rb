require 'sinatra'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'


db_conn = PG.connect(:dbname => 'online_bookstore')

file = File.new("users.csv", "a+")

file.each do |line|
  user = line.split(",")
  name = user[0]
  surname = user[1]
  email = user[2]
  phone_no = user[3]
  street_no = user[4]
  street_name = user[5]
  suburb = user[6]
  postcode = user[7]


  sql  = "INSERT INTO users (name, surname, email, phone_no, street_no, street_name, suburb, postcode)"
  sql += "VALUES ( '#{name}', '#{surname}', '#{email}', '#{phone_no}', '#{street_no}', '#{street_name}', '#{suburb}', '#{postcode}');"

  db_conn.exec(sql)

end

file.close

db_conn.close
