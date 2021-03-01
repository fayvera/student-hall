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
        binding.pry
        if logged_in?
            @course = Course.find_by_slug(params[:slug])
            @posts = Post.find_by(:course_id => @course.id)
            @posts.each{ |post| @author = Student.find_by(:id => post.student_id)}
            erb :"/courses/course_show"
        else
            redirect to '/login'
        end
    end
end
