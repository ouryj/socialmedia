require 'sinatra'
require_relative 'models'
require 'sinatra/flash'
enable :sessions



get "/" do
    erb :home
end

get '/login' do
    erb :login
  end
  
  post '/signup' do
    user = User.create(
        firstname: params[:firstname],
        lastname: params[:lastname],
        email: params[:email],
        username: params[:username],
        password: params[:password],
        Birthday: params[:birthday]
    )
    session[:user_id] = user.id
    
    session[:user_id] = nil 
    redirect '/'
  end

  post '/login' do
    if params[:username] && params[:password].empty?
        redirect '/logout'
    end 
    user = User.find_by(username: params[:username])
  
    if user && user.password == params[:password]
        session[:user_id] = user.id
        
        redirect'/posts'
    else
        redirect '/'
    end
  end
  get "/posts" do
    last_post = Post.all
    @last_posts = last_post.last(20).reverse
    erb :posts
  end
  get "/logout" do
    session[:user_id] = nil 
    redirect '/'
  end
  post '/posts' do
    last_post = Post.all
    user = User.find(session[:user_id])
    @post = Post.create(
        content: params[:textarea],
        user_id: user.id,
        posted_at: Time.now 
         )
    @profile = user.username
    @mypost = @post.content
    @last_posts = last_post.last(20).reverse
    
    erb :posts
  end

get "/usersposts" do
    @current_user = User.find(session[:user_id])
    # @posts = Post.find(session[:user_id]).content
    @all_post = Post.all
    erb :usersposts

end
post '/search' do
    @user = User.find_by(firstname: params[:search])
#    @user.firstname ==  params[:search]
    @name1 = @user.firstname 
    @name2 = @user.lastname
    @username = @user.username
    @userpost = @user.posts.all.first.content
    erb :posts
    
   
 
end
get '/delete' do 
    erb :delete
end

post '/delete' do
 user = User.find(session[:user_id])
 user.destroy
 session[:user_id] = nil 
 redirect "/"
end

get '/profile' do
    user = User.find(session[:user_id])
    @name1  = user.firstname
    @name2 = user.lastname
    @username = user.username
    @email = user.email
    @birthday = user.Birthday
    @post = user.posts.all.first.content
    erb :profile
  end
  get '/users' do
    @all_users = User.all 
    
    erb :users
   
  end
  post '/personalposts' do
    post = User.find(1)
    @user_posts = post.posts.all
    
    erb :personalposts
  end
  get '/setting' do
    erb :setting
  end
  post '/setting' do
    user = User.find(session[:user_id])
    user.update(
        firstname: params[:firstname],
        lastname: params[:lastname],
        email: params[:email],
        Birthday: params[:birthday],
        username: params[:username],
        password: params[:password]
    )
    erb :profile
  end
