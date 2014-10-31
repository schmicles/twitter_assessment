#Index - Show All
get '/tweets' do
  @tweets = Tweet.all
  @tweets = Tweet.order("tweets.created_at desc")
  erb :'tweets/index'
end


#Create
post '/tweets' do
  user = User.find_by(id: session[:user_id])
  new_tweet = Tweet.create(tweet: params[:post], user_id: user.id)

  redirect '/users'
end

#Delete
# delete '/tweets/:id' do
#   Tweet.find(params[:id]).destroy
#   redirect 'tweets/show'
# end