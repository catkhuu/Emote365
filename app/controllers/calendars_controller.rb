class CalendarsController < ApplicationController
  def index
    @calendars = current_user.calendars
  end

  def new
  end

  def create
    p '=============================='
    p params.keys
    @user = current_user
    if !@user.calendars
      current_user.update(email: params[:user][:email])
      # Calendar.create(user_id: current_user.id type: 'dynamic')

    else

    end
    #   params[:location] =
    # #  update user profile
    # #  create calendar
    # else
    #
    # end
  end

  private

  def get_tweets(weoid)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV[TWITTER_CONSUMER_KEY]
      config.consumer_secret     = ENV[TWITTER_CONSUMER_SECRET]
      config.access_token        = ENV[TWITTER_ACCESS_TOKEN]
      config.access_token_secret = ENV[TWITTER_ACCESS_TOKEN_SECRET]
    end
    bunding.pry
    client.trends(id=2459115, options={})
  end

  def get_emotions()

  end

  def get_image()

  end
end
