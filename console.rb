require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'active_record'
require_relative 'database_config'
require_relative 'models/user'
require_relative 'models/comment'
require_relative 'models/book'
require_relative 'models/purchase'


binding.pry
