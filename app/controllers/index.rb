get '/' do
  # Look in app/views/index.erb
  if session[:user_id] == nil
    erb :index
  else
    redirect '/tweets'
  end
end

