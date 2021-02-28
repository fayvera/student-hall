
require 'bundler/setup'
Bundler.require

require_all 'app'

ActiveRecord::Base.establish_connection(
    adapter: "sqlite3", database: "db/student_hall.db"
)