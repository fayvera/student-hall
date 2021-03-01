require_relative './config/environment'
require 'sinatra/activerecord/rake'
require_relative './app/controllers'



task :console do
    def reload! 
        load_all 'app'
    end
    Pry.start
end