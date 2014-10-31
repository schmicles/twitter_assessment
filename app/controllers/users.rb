# Show - Index
get '/users' do
  tweets_array = []
  @user = User.find_by(id: session[:user_id])
  @tweets_array = @user.tweets
  @tweets_array = Tweet.order("tweets.created_at desc")
  erb :'/users/show'
end


#Create
post '/users' do
  if params[:submit] == "create"
    User.create(username: params[:username], password: params[:password])
    redirect "/?notice=success"
  else
    # byebug
    if User.valid?(params[:username])
      new_user = User.find_by(username: params[:username])

      if new_user.authenticate(params[:password])
        session[:user_id] = new_user.id
        redirect "/tweets"
      else
        redirect "/?notice=wrong_password"
      end
    else
      redirect "/?notice=no_account"
    end
  end
end

delete '/users/logout' do
  session.clear
  redirect '/?logout_success'
end