class EduController < ApplicationController 

    get '/edu/index' do
        check_login
        @provider = current_provider.edu 

        erb :'/edu/index'
    end
    get '/edu/new' do 
        check_login

        erb :'/edu/new'
    end

    post '/edu/new' do 
        check_login

        @edu = current_provider.edu.create(title: params[:title], content: params[:content])     
        redirect to :'/edu/index'
    end

    get '/edu/:id' do 
        check_login

        @edu = Edu.find(params[:id])
        if @edu.provider == current_provider
            erb :'/edu/view'
        else
            redirect to '/provider/view'
        end
    end
    get '/edu/:id/edit' do 
        check_login
        if logged_in_p? && Edu.find_by(id: params[:id]).provider == current_provider
            @edu = Edu.find(params[:id])
            erb :'/edu/edit'
        else
            @provider = current_provider
            erb :'/provider/view'

        end
    end

    patch '/edu/:id' do 
        check_login
        @edu = Edu.find(params[:id])
        @edu.content = (params[:content])
        if @edu.save
            redirect to "/edu/#{@edu.id}"
        else
            redirect "edu/#{@edu.id}/edit"
        end
    end
    delete "/edu/:id/delete" do 
        check_login
        edu = Edu.find(params[:id])
        edu.destroy
        redirect "/edu/index"
    end



end