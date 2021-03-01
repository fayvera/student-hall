class PostsController < ApplicationController
    
    get '/posts' do 
        if logged_in?
            erb :'/posts/posts'
        else
            redirect to '/login'
        end
    end

end