
require 'bundler/setup'
Bundler.require

require 'sinatra/activerecord'
require 'sinatra'
require_all 'app'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3", 
  database: "db/student_hall.db"
)

# ActiveRecord::Base.establish_connection(
#   adapter: 'sqlite3',
#   database:  'db.sqlite3'
# )




# set :database, "sqlite3:student_hall.sqlite3"