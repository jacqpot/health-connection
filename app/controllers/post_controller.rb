class PostController < ApplicationController


    get "/post/index" do
      @user = current_user.post
      erb :"/post/index"
    end
  
  
    get "/post/new" do
      erb :"/post/new"
    end
  
  
    post "/post/new" do
      @post = current_user.post.create(title: params[:title], content: params[:content])

        redirect to :'/post/index'
 
    end
  
  
    get "/post/:id" do
      # if logged_in? 
      #   # binding.pry
        @post = Post.find(params[:id])
        erb :"/post/view"
      # else 
      #   redirect to '/user/login'
      # end
    end
  
  
    get "/post/:id/edit" do
      if logged_in?
        @post = Post.find(params[:id])
        erb :'/post/edit'
      else
      erb :"/user/index"
      end
    end
  
  
    patch "/post/:id" do
      post = Post.find(params[:id])
      post.content = (params[:content])
      if post.save
        redirect to "/post/#{post.id}"
      else
        redirect "/post/#{post.id}/edit"
      
      end
    end
  
    delete "/post/:id/delete" do
      post = Post.find(params[:id])
      post.destroy
      redirect "/post/index"
    end
end
  