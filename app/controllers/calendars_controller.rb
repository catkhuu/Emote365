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

    trends = client.trends(id=2459115, options={}).attr[:trends]
    trends.map {|a| a[:name]}.join(' ');
  end

  def get_emotions(text)
    uri = URI('https://westus.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment')

    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = ENV[MICROSOFT_KEY]
    # Request body
    request.body = {
      "documents": [
        {
          "language": "en",
          "id": "string",
          "text": text
        }
      ]
    }.to_json

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end



    score = JSON.parse(response.body)["documents"][0]["score"]
    if score < .33
      'sad'
    elsif score < .66
      'ok'
    else
      'happy'
    end
  end

  def get_image(sentiment)
    response = open('https://pixabay.com/api/?key='+ ENV[PIXA_KEY] +'&q=' + sentiment + '&image_type=photo').read
    image = JSON.parse(response)
    image["hits"].shuffle.sample["webformatURL"]
  end
end
