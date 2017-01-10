module TwitterHelper
  
  def get_trends(weoid)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end

    trends = client.trends(id=2459115, options={}).attrs[:trends]
  end

  def top_trends(weoid)
    trending_tweets = get_trends(weoid)
    trending_tweets.reject { |trend| trend[:tweet_volume] == nil }.sort { |high, low| low[:tweet_volume] <=> high[:tweet_volume] }
  end
end
