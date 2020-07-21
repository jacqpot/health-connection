require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
  end

  get "/" do
    redirect to '/user'
  end
  helpers do
    
    def logged_in?
			!!current_user
    end
    def current_user
      User.find_by(id: session[:user_id]) if session[:user_id]
      
    end

    
    def logged_in_p? 
      !!current_provider
    end
    def current_provider
      Provider.find_by(id: session[:provider_id]) if session[:provider_id]
    end
	end
end
