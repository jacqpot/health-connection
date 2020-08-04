class UserController < ApplicationController

    get '/user' do
   

        erb :"/user/index"
    end

    get '/user/signup' do

        @provider = Provider.all 
        erb :"/user/new"
    end

    get '/user/login' do


        erb :'/user/login'
       
    end
    get '/user/homepage' do 
        check_login
        @apointment = Apointment.find_by(user_id: session[:user_id])
        @user = User.find_by_id(session[:user_id])
        erb :'/user/view'
    end


    post "/user/login" do
            @user = User.find_by(:name => params[:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
  
            erb :"/user/view"
        end
    end

    post '/user/signup' do

        @user = User.create(name: params[:name], password: params[:password], provider_id: params[:provider_id])
        if @user.valid?
            erb :"/user/login"
        else  
            redirect to '/user/signup'
        end
    end

     get '/user/logout' do 

        session.clear
        redirect '/'
     end

end