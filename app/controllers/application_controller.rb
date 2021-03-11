require './config/environment'
require 'dotenv/load'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
    register(Sinatra::Flash)
  end
  
  
  
  get '/' do
    if logged_in?
      redirect to "/posts/posts"
    else
      erb :index
    end
  end

  helpers do 
    def logged_in?
      !!current_user
    end
    
    def current_user
      @current_user ||= Student.find_by(id: session[:user_id]) if session[:user_id]
    end 

  end
end