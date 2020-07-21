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
end