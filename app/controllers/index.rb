get '/' do
  erb :index
end

get '/:username' do
  @user = TwitterUser.find_by_handle(params[:username])

  if !@user 

    @user = TwitterUser.create(handle: params[:username])
    # @user.fetch_tweets!
    erb :load_tweets
  elsif @user.tweets_stale?   # AJAX request should refresh the cache,
                              # returning list of tweets to be rendered
    @user.fetch_tweets! 

    erb :load_tweets 
  else  
    @tweets = @user.tweets.limit(10)
    @tweets.reverse!
    erb :show_tweets
  end
end

post '/find_user' do

  redirect to "/#{params[:handle]}"
end
