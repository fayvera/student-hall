class PostsController < ApplicationController

    get '/posts' do 
        # binding.pry

        if logged_in?
            @posts = Post.all
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

    get '/posts/:id' do
        # binding.pry
        if logged_in?
            @post = Post.find_by_id(params[:id])
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

    post '/posts' do
    #     binding.pry
        if logged_in?
              @course_association = Course.find_by(:name => params[:course])
              @post = Post.create(:title => params[:title], :course_id => @course_association.id, :content => params[:content], :student_id => current_user.id)
              
              current_user.posts << @post
              
              redirect to "/courses/#{@post.course.slug}"
        else
            redirect to '/'
        end
    end

    patch '/posts/:id' do 
        if logged_in?
            if  params[:content] == "" || params[:title] == "" || params[:course] == ""
                flash[:notice] = "One or more fields left empty"
                redirect to "/posts/#{params[:id]}/edit"  
            else
                @post = Post.find_by_id(params[:id])
                if @post && @post.student_id == current_user.id
                    @course_association = Course.find_by(:name => params[:course])
                    if @post.update(content: params[:content], title: params[:title], course_id: @course_association.id, student_id: @post.student_id)
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
                flash[:notice] = "Post deleted successfully!"
                redirect to '/posts'
            end
        end
    end

end