class CoursesController < ApplicationController
    get '/courses' do 
        if logged_in?
            erb :course_index
        else
            redirect to "/login"
        end
    end

    get '/courses/:id' do 
        
    end
end