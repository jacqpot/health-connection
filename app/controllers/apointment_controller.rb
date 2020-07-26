class ApointmentController < ApplicationController 

    get '/apointment/index' do
        check_login
        @user = current_user.apointment 

        erb :'/apointment/index'
    end
    get '/apointment/new' do 
        check_login

        erb :'/apointment/new'
    end

    post '/apointment/new' do 
        check_login

        @apointment = current_user.apointment.create(reason: params[:reason], date_and_time: params[:date_and_time])     
        redirect to :'/apointment/index'
    end

    get '/apointment/:id' do 
        check_login

        @apointment = apointment.find(params[:id])
        if @apointment.user == current_user
            erb :'/apointment/view'
        else
            redirect to '/user/view'
        end
    end
    get '/apointment/:id/edit' do 
        check_login
        if logged_in_p? && apointment.find_by(id: params[:id]).user == current_user
            @apointment = apointment.find(params[:id])
            erb :'/apointment/edit'
        else
            @user = current_user
            erb :'/user/view'

        end
    end

    patch '/apointment/:id' do 
        check_login
        @apointment = apointment.find(params[:id])
        @apointment.content = (params[:content])
        if @apointment.save
            redirect to "/apointment/#{@apointment.id}"
        else
            redirect "apointment/#{@apointment.id}/edit"
        end
    end
    delete "/apointment/:id/delete" do 
        check_login
        apointment = apointment.find(params[:id])
        apointment.destroy
        redirect "/apointment/index"
    end



end