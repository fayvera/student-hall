class PostsController < ApplicationController

    get '/posts' do 
        if logged_in?
            @posts = Post.all
            @students = Student.all
            @courses = Course.all
            erb :'/posts/posts'
        else
            redirect to '/login'
        end
    end

    get '/posts/new' do
        if logged_in?
            @courses = Course.all
            erb :'/posts/new'
        else
            redirect to '/login'
        end
    end

    post '/posts' do
        if logged_in?
              @course_association = Course.find_by(:name => params[:course])
              if params[:course] != @course_association
                  Course.create(:name => params[:course])
              end 
              @post = Post.create(:title => params[:title], :course_id => @course_association.id, :content => params[:content], :student_id => current_user.id)
              redirect to "/posts/#{@post.id}"
        else
            redirect to '/'
        end
    end

    get '/posts/:id' do
        if logged_in?
            @post = Post.find_by_id(params[:id])
            @author = Student.find_by(:id => @post.student_id)
            @course = Course.find_by(:id => @post.course_id)
            erb :"/posts/show_post"
        else 
            redirect to '/login'
        end
    end

    get '/posts/:id/edit' do 
        if logged_in?
            @courses = Course.all
            @post = Post.find_by_id(params[:id])
            erb :"/posts/edit_post"
        else
            redirect to '/login'
        end
    end

    patch '/posts/:id' do 
        # binding.pry
        if logged_in?
            if  params[:content] == "" || params[:title] == "" || params[:course] == ""
                redirect to "/posts/#{params[:id]}/edit"
            else
                @post = Post.find_by_id(params[:id])
                if @post && @post.student_id == current_user.id
                    @course_association = Course.find_by(:name => params[:course])
                    if @post.update(content: params[:content], title: params[:title], course_id: @course_association.id)
                        redirect to "/posts/#{@post.id}"
                    else 
                        redirect tp "/posts/#{@post.id}/edit"
                    end
                else
                    redirect to "/posts"
                end
            end
        else
            redirect to "/login"
        end
    end

    delete '/posts/:id/delete' do
        if !logged_in?
            redirect to '/login'
        else
            @post = Post.find_by(:id => params[:id])
            if @post && @post.student_id == current_user.id
                @post.delete
                redirect to '/posts'
            end
        end
    end


end