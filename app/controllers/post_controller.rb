class PostController < ApplicationController


    get "/post/index" do
     check_login

      @user = current_user.post
        erb :"/post/index"
    end
  
  
    get "/post/new" do
      check_login
      erb :"/post/new"
    end
  
  
    post "/post/new" do
      check_login
      @post = current_user.post.create(title: params[:title], content: params[:content])

        redirect to :'/post/index'
 
    end
  
  
    get "/post/:id" do
      check_login
      # if logged_in? 
      #   # binding.pry
      @post = Post.find(params[:id])
      if @post.user == current_user
        erb :"/post/view"
      else 
        redirect to '/user/view'
      end
    end
  
  
    get "/post/:id/edit" do
      check_login
      if logged_in? && Post.find_by(id: params[:id]).user == current_user
        @post = Post.find(params[:id])
        erb :'/post/edit'
      else
        @user = current_user
      erb :"/user/view"
      end
    end
  
  
    patch "/post/:id" do
      check_login
      post = Post.find(params[:id])
      post.title = (params[:title])
      post.content = (params[:content])
      if post.save
        redirect to "/post/#{post.id}"
      else
        redirect "/post/#{post.id}/edit"
      
      end
    end
  
    delete "/post/:id/delete" do
      check_login
      post = Post.find(params[:id])
      post.destroy
      redirect "/post/index"
    end
end
  