class ProviderController < ApplicationController 

    get '/provider/signup' do
        erb :"/provider/new"
    end
    get '/provider/login' do 
        erb :'/provider/login'
    end
    get '/provider/homepage' do 
        check_login

            @provider = Provider.find_by(id: session[provider_id])
            erb :'/provider/view'


    end
    post "/provider/login" do 

        @provider = Provider.find_by(:name => params[:name])
        if @provider && @provider.authenticate(params[:password])
            session[:provider_id] = @provider.id
            @session = session
            erb :'/provider/view'
        end
    end
    post '/provider/signup' do 
        @provider = Provider.create(name: params[:name], title: params[:title], password: params[:password])
        erb :'/provider/login'
    end
    get '/provider/logout' do 
        session.clear
        redirect '/'
    end
    get '/provider/patients' do
        check_login

        @users = current_provider.user
        erb :'/provider/users'
    end
end