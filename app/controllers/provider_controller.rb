class ProviderController < ApplicationController 

    get '/provider/signup' do
        erb :"/provider/new"
    end
    get '/provider/login' do 
        erb :'/provider/login'
    end
    get '/provider/homepage' do 
        @provider = Provider.find_by_id(session[user_id])
        erb :'/provider/view'

    end
    post "provider/login" do 
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
end