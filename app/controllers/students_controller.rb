class StudentsController < ApplicationController

    get '/signup' do 
        erb :'/students/create_students'
    end
    
    get '/login' do
        if !logged_in?
            erb :'/students/login'
        else
            redirect to "/posts"
        end
    end
    
    post '/signup' do
        if logged_in?
            redirect to "/posts"
        else
            if params[:first_name] == "" || params[:last_name] == "" || params[:email] == "" || params[:password] == ""
                redirect to '/signup', locals = {message: "Please fill out all fields"}
            # elsif params[:email] == Student.find_by(email: params[:email])
            #     redirect to '/signup', locals = {message: "Email is already in use. Please use another email or log in if you have an account."}
            else
                @student = Student.create(:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email], :password => params[:password])
                session[:user_id] = @student.id
                redirect to "/posts"
            end 
        end
    end

    post '/login' do
        student = Student.find_by(:email => params[:email])
        if student && student.authentificate(params[:password])
            session[:user_id] = student.id
            redirect to '/posts'
        else
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


end