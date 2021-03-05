class StudentsController < ApplicationController

    get '/signup' do 
        if logged_in?
            redirect to '/posts'
        else
            erb :'/students/create_students'
        end
    end
    
    get '/login' do
        if !logged_in?
            erb :'/students/login'
        else
            redirect to "/students/#{current_user.slug}"
        end
    end
    
    post '/signup' do
        if logged_in?
            redirect to "/posts"
        else
            if params[:first_name] == "" || params[:last_name] == "" || params[:email] == "" || params[:password] == ""
                flash[:notice] = "Please fill out all fields"
                redirect to '/signup'
            elsif params[:email] == Student.find_by(email: params[:email])
                flash[:notice] = "Email is already in use. Please use another email or log in if you have an account"
                redirect to '/signup'
            else
                student = Student.create(:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email], :password => params[:password])
                session[:user_id] = student.id
                flash[:notice] = "Welcome to Study Hall!"
                redirect to "/posts"
            end 
        end
    end

    post '/login' do
        student = Student.find_by(:email => params[:email])
        if student && student.authenticate(params[:password])
            session[:user_id] = student.id
            flash[:notice] = "Welcome Back!"
            redirect to "/students/#{current_user.slug}"
        else
            flash[:notice] = "No student found! Please sign up."
            redirect to '/signup'
        end
    end

    get '/students/:slug' do
 
        if logged_in?
            @student = Student.find_by_slug(params[:slug])

            erb :'/students/show'
        else
            redirect to "/login"
        end
    end

    get '/logout' do
        if logged_in?
            session.destroy
            redirect to '/login'
        else 
            redirect to '/login'
        end
    end




end