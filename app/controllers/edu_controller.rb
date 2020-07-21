class EduController < ApplicationController 

    get '/edu/index' do 
        @provider = current_provider.edu 
        erb :'/edu/index'
    end
    get '/edu/new' do 
        erb :'/edu/new'
    end

end