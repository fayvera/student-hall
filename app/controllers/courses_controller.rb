class CoursesController < ApplicationController
    get '/courses' do 
        if logged_in?
            @courses = Course.all
            erb :"/courses/course_index"
        else
            redirect to "/login"
        end
    end

    get '/courses/:slug' do 
        if logged_in?
            @course = Course.find_by_slug(params[:slug])
            @posts = @course.posts 
            erb :"/courses/course_show"
        else
            redirect to '/login'
        end
    end

    get '/courses/new' do
        if logged_in?
            erb :"/courses/create_course"
        else
            redirect to '/login'
        end
    end

    post '/courses' do 


    end
end
