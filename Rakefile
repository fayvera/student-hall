require_relative './config/environment'
require 'sinatra/activerecord/rake'
require_all 'app'



task :console do
    def reload! 
        load_all 'app'
    end
    Pry.start
end