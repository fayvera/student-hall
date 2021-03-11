require_relative './config/environment'
require 'sinatra/activerecord/rake'
require_all 'app'


# require 'dotenv/tasks'

# task mytask: :dotenv do
#     # things that require .env
# end

task :console do
    def reload! 
        load_all 'app'
    end
    Pry.start
end