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

    get "/courses/new" do
        if logged_in?
            @courses = Course.all
            erb :'/courses/create_course'
        else
            redirect to '/login'
        end
    end

    post '/courses' do 
        if logged_in?
            if params[:name] == Course.find_by(:name => params[:name])
                redirect to "/courses/new", notice: "Study group already exists"
            else
                course = Course.create(:name => params[:name], :description => params[:description])
                redirect to "/courses/#{course.slug}"
            end
        else
            redirect to '/login'
        end
    end
end
