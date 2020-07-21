class EduController < ApplicationController 

    get '/edu/index' do 
        @provider = current_provider.edu 
        erb :'/edu/index'
    end
    get '/edu/new' do 
        erb :'/edu/new'
    end

    post '/edu/new' do 
        @edu = current_provider.edu.create(title: params[:title], content: params[:content])
        redirect to :'/edu/index'
    end

    get '/edu/:id' do 
        @edu = Edu.find(params[:id])
        if @edu.user == current_provider
            erb :'/edu/view'
        else
            redirect to '/provider/view'
        end
    end
    

end