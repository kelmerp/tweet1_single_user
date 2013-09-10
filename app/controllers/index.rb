# using Fake Pat Mood twitter account  username fakepatmood password:passwordpassword

# Access level   Read, write, and direct messages 
# About the application permission model
# Consumer key  QpCKEfP0eQImD7GaUdfdw
# Consumer secret JtxnHqUxZQ6fI4T4HFofZa2X1qZCvB2CHkouVuVMI
# Request token URL https://api.twitter.com/oauth/request_token
# Authorize URL https://api.twitter.com/oauth/authorize
# Access token URL  https://api.twitter.com/oauth/access_token

# Access token  1578293246-UJyL7DftALHb4VAyi5JozxqjMlI6wwtbx7JRBi8
# Access token secret tOVbjd8VjU77RerEXHFJTiqaG7lE76u4ZGQtwExK7R4
# Access level  Read, write, and direct messages

get '/' do
  erb :index
end

post '/tweet' do
  begin
    # p params
    sleep 2
    #getting params[:tweet] from index.erb
    Twitter.update(params[:tweet])
    @message = "Your tweet was sent successfully!"
    erb :index
  rescue
    @error = "Something went wrong, sorry!  You know you can't tweet the same \
    thing twice, right?"
    erb :index
  end
end


# get '/:username' do
#   @user = TwitterUser.find_by_handle(params[:username])

#   if !@user 

#     @user = TwitterUser.create(handle: params[:username])
#     # @user.fetch_tweets!
#     erb :load_tweets
#   elsif @user.tweets_stale?   # AJAX request should refresh the cache,
#                               # returning list of tweets to be rendered
#     @user.fetch_tweets! 

#     erb :load_tweets 
#   else  
#     @tweets = @user.tweets.limit(10)
#     @tweets.reverse!
#     erb :show_tweets
#   end
# end

# post '/find_user' do

#   redirect to "/#{params[:handle]}"
# end
