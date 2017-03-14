require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'online_bookstore',
  username: 'Barry'
}

ActiveRecord::Base.establish_connection(options)
