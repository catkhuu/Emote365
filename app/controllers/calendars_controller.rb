class CalendarsController < ApplicationController
  def index
    @calendars = current_user.calendars
  end

  def new
  end

  def create
    @user = current_user
    if @user.email == ''
      @user.update_attribute(:email, params[:user][:email])
      @calendar = Calendar.create(user_id: current_user.id)
      hashtags = get_tweets(params[:location])
      sentiment = get_emotions(hashtags.map {|a| a[:name]}.join(' '))
      require 'open-uri'
      image_url = get_image(sentiment)
      @day = Day.create(calendar: @calendar, image_url: image_url, location: params[:location].to_s)

      hashtags.each do |hashtag|
        Trend.create(hashtag: hashtag["name"], )
      end
    else
      @calendar = Calendar.find_by(user_id: current_user.id)
    end
    #   params[:location] =
    # #  update user profile
    # #  create calendar
    # else
    #
    # end
    redirect_to calendar_path(@calendar)
  end

  def show
    @day = Calendar.find_by(user_id: current_user.id).days.last
    render 'calendars/show'
  end

  private

  def get_tweets(weoid)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end

    trends = client.trends(id=2459115, options={}).attrs[:trends]
    # trends = [
    #   {:name=>"#COYS",
    #   :url=>"http://twitter.com/search?q=%23COYS",
    #   :promoted_content=>nil,
    #   :query=>"%23COYS",
    #   :tweet_volume=>69280},
    #  {:name=>"Soulja",
    #   :url=>"http://twitter.com/search?q=Soulja",
    #   :promoted_content=>nil,
    #   :query=>"Soulja",
    #   :tweet_volume=>556744},
    #  {:name=>"#ThingsIWontApologizeFor",
    #   :url=>"http://twitter.com/search?q=%23ThingsIWontApologizeFor",
    #   :promoted_content=>nil,
    #   :query=>"%23ThingsIWontApologizeFor",
    #   :tweet_volume=>99244},
    #  {:name=>"Obamacare",
    #   :url=>"http://twitter.com/search?q=Obamacare",
    #   :promoted_content=>nil,
    #   :query=>"Obamacare",
    #   :tweet_volume=>315785},
    #  {:name=>"#CES2017",
    #   :url=>"http://twitter.com/search?q=%23CES2017",
    #   :promoted_content=>nil,
    #   :query=>"%23CES2017",
    #   :tweet_volume=>124891},
    #  {:name=>"Grayson Allen",
    #   :url=>"http://twitter.com/search?q=%22Grayson+Allen%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Grayson+Allen%22",
    #   :tweet_volume=>15301},
    #  {:name=>"#BetterHookyExcuses",
    #   :url=>"http://twitter.com/search?q=%23BetterHookyExcuses",
    #   :promoted_content=>nil,
    #   :query=>"%23BetterHookyExcuses",
    #   :tweet_volume=>nil},
    #  {:name=>"#WarningSignsOfACreep",
    #   :url=>"http://twitter.com/search?q=%23WarningSignsOfACreep",
    #   :promoted_content=>nil,
    #   :query=>"%23WarningSignsOfACreep",
    #   :tweet_volume=>19093},
    #  {:name=>"Troy Terry",
    #   :url=>"http://twitter.com/search?q=%22Troy+Terry%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Troy+Terry%22",
    #   :tweet_volume=>13450},
    #  {:name=>"Jay Wright",
    #   :url=>"http://twitter.com/search?q=%22Jay+Wright%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Jay+Wright%22",
    #   :tweet_volume=>nil},
    #  {:name=>"Luke Kennard",
    #   :url=>"http://twitter.com/search?q=%22Luke+Kennard%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Luke+Kennard%22",
    #   :tweet_volume=>nil},
    #  {:name=>"Andrew White",
    #   :url=>"http://twitter.com/search?q=%22Andrew+White%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Andrew+White%22",
    #   :tweet_volume=>nil},
    #  {:name=>"Matt Jones",
    #   :url=>"http://twitter.com/search?q=%22Matt+Jones%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Matt+Jones%22",
    #   :tweet_volume=>nil},
    #  {:name=>"Milt Schmidt",
    #   :url=>"http://twitter.com/search?q=%22Milt+Schmidt%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Milt+Schmidt%22",
    #   :tweet_volume=>nil},
    #  {:name=>"Late Registration",
    #   :url=>"http://twitter.com/search?q=%22Late+Registration%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Late+Registration%22",
    #   :tweet_volume=>13768},
    #  {:name=>"Carter Hart",
    #   :url=>"http://twitter.com/search?q=%22Carter+Hart%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Carter+Hart%22",
    #   :tweet_volume=>nil},
    #  {:name=>"Wonder Girls",
    #   :url=>"http://twitter.com/search?q=%22Wonder+Girls%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Wonder+Girls%22",
    #   :tweet_volume=>nil},
    #  {:name=>"Medium",
    #   :url=>"http://twitter.com/search?q=Medium",
    #   :promoted_content=>nil,
    #   :query=>"Medium",
    #   :tweet_volume=>132933},
    #  {:name=>"Hollis Thompson",
    #   :url=>"http://twitter.com/search?q=%22Hollis+Thompson%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Hollis+Thompson%22",
    #   :tweet_volume=>nil},
    #  {:name=>"Jalen Brunson",
    #   :url=>"http://twitter.com/search?q=%22Jalen+Brunson%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Jalen+Brunson%22",
    #   :tweet_volume=>nil},
    #  {:name=>"Hinkle",
    #   :url=>"http://twitter.com/search?q=Hinkle",
    #   :promoted_content=>nil,
    #   :query=>"Hinkle",
    #   :tweet_volume=>nil},
    #  {:name=>"Matthew Fisher-Davis",
    #   :url=>"http://twitter.com/search?q=%22Matthew+Fisher-Davis%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Matthew+Fisher-Davis%22",
    #   :tweet_volume=>nil},
    #  {:name=>"Tareck El Aissami",
    #   :url=>"http://twitter.com/search?q=%22Tareck+El+Aissami%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Tareck+El+Aissami%22",
    #   :tweet_volume=>18345},
    #  {:name=>"Frank Jackson",
    #   :url=>"http://twitter.com/search?q=%22Frank+Jackson%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Frank+Jackson%22",
    #   :tweet_volume=>nil},
    #  {:name=>"Roberson",
    #   :url=>"http://twitter.com/search?q=Roberson",
    #   :promoted_content=>nil,
    #   :query=>"Roberson",
    #   :tweet_volume=>nil},
    #  {:name=>"Tottenham",
    #   :url=>"http://twitter.com/search?q=Tottenham",
    #   :promoted_content=>nil,
    #   :query=>"Tottenham",
    #   :tweet_volume=>132782},
    #  {:name=>"Miles Bridges",
    #   :url=>"http://twitter.com/search?q=%22Miles+Bridges%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Miles+Bridges%22",
    #   :tweet_volume=>nil},
    #  {:name=>"Real Madrid",
    #   :url=>"http://twitter.com/search?q=%22Real+Madrid%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Real+Madrid%22",
    #   :tweet_volume=>115970},
    #  {:name=>"J.T. Barrett",
    #   :url=>"http://twitter.com/search?q=%22J.T.+Barrett%22",
    #   :promoted_content=>nil,
    #   :query=>"%22J.T.+Barrett%22",
    #   :tweet_volume=>nil},
    #  {:name=>"John Gillon",
    #   :url=>"http://twitter.com/search?q=%22John+Gillon%22",
    #   :promoted_content=>nil,
    #   :query=>"%22John+Gillon%22",
    #   :tweet_volume=>nil},
    #  {:name=>"Thunder 22",
    #   :url=>"http://twitter.com/search?q=%22Thunder+22%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Thunder+22%22",
    #   :tweet_volume=>nil},
    #  {:name=>"Hotel Alder",
    #   :url=>"http://twitter.com/search?q=%22Hotel+Alder%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Hotel+Alder%22",
    #   :tweet_volume=>nil},
    #  {:name=>"Eron Harris",
    #   :url=>"http://twitter.com/search?q=%22Eron+Harris%22",
    #   :promoted_content=>nil,
    #   :query=>"%22Eron+Harris%22",
    #   :tweet_volume=>nil},
    #  {:name=>"#ICouldntLie",
    #   :url=>"http://twitter.com/search?q=%23ICouldntLie",
    #   :promoted_content=>nil,
    #   :query=>"%23ICouldntLie",
    #   :tweet_volume=>nil},
    #  {:name=>"#CHRISTIANSCOVER",
    #   :url=>"http://twitter.com/search?q=%23CHRISTIANSCOVER",
    #   :promoted_content=>nil,
    #   :query=>"%23CHRISTIANSCOVER",
    #   :tweet_volume=>nil},
    #  {:name=>"#BLMKidnapping",
    #   :url=>"http://twitter.com/search?q=%23BLMKidnapping",
    #   :promoted_content=>nil,
    #   :query=>"%23BLMKidnapping",
    #   :tweet_volume=>nil},
    #  {:name=>"#SelfieForSeb",
    #   :url=>"http://twitter.com/search?q=%23SelfieForSeb",
    #   :promoted_content=>nil,
    #   :query=>"%23SelfieForSeb",
    #   :tweet_volume=>29275},
    #  {:name=>"#100ThingsIDidIn2016",
    #   :url=>"http://twitter.com/search?q=%23100ThingsIDidIn2016",
    #   :promoted_content=>nil,
    #   :query=>"%23100ThingsIDidIn2016",
    #   :tweet_volume=>nil},
    #  {:name=>"#pugchat",
    #   :url=>"http://twitter.com/search?q=%23pugchat",
    #   :promoted_content=>nil,
    #   :query=>"%23pugchat",
    #   :tweet_volume=>nil},
    #  {:name=>"#TriviaDay",
    #   :url=>"http://twitter.com/search?q=%23TriviaDay",
    #   :promoted_content=>nil,
    #   :query=>"%23TriviaDay",
    #   :tweet_volume=>nil},
    #  {:name=>"#BrittanyHerring",
    #   :url=>"http://twitter.com/search?q=%23BrittanyHerring",
    #   :promoted_content=>nil,
    #   :query=>"%23BrittanyHerring",
    #   :tweet_volume=>nil},
    #  {:name=>"#Tucker",
    #   :url=>"http://twitter.com/search?q=%23Tucker",
    #   :promoted_content=>nil,
    #   :query=>"%23Tucker",
    #   :tweet_volume=>nil},
    #  {:name=>"#boostyourLCS",
    #   :url=>"http://twitter.com/search?q=%23boostyourLCS",
    #   :promoted_content=>nil,
    #   :query=>"%23boostyourLCS",
    #   :tweet_volume=>nil},
    #  {:name=>"#WineWednesday",
    #   :url=>"http://twitter.com/search?q=%23WineWednesday",
    #   :promoted_content=>nil,
    #   :query=>"%23WineWednesday",
    #   :tweet_volume=>nil},
    #  {:name=>"#DukeNation",
    #   :url=>"http://twitter.com/search?q=%23DukeNation",
    #   :promoted_content=>nil,
    #   :query=>"%23DukeNation",
    #   :tweet_volume=>nil},
    #  {:name=>"#PureMagic",
    #   :url=>"http://twitter.com/search?q=%23PureMagic",
    #   :promoted_content=>nil,
    #   :query=>"%23PureMagic",
    #   :tweet_volume=>nil},
    #  {:name=>"#pcbb",
    #   :url=>"http://twitter.com/search?q=%23pcbb",
    #   :promoted_content=>nil,
    #   :query=>"%23pcbb",
    #   :tweet_volume=>nil},
    #  {:name=>"#bkchatldn",
    #   :url=>"http://twitter.com/search?q=%23bkchatldn",
    #   :promoted_content=>nil,
    #   :query=>"%23bkchatldn",
    #   :tweet_volume=>15682},
    #  {:name=>"#amnhscicafe",
    #   :url=>"http://twitter.com/search?q=%23amnhscicafe",
    #   :promoted_content=>nil,
    #   :query=>"%23amnhscicafe",
    #   :tweet_volume=>nil},
    #  {:name=>"#StreamLady",
    #   :url=>"http://twitter.com/search?q=%23StreamLady",
    #   :promoted_content=>nil,
    #   :query=>"%23StreamLady",
    #   :tweet_volume=>nil}
    # ]

    trends
  end

  def get_emotions(text)
    uri = URI('https://westus.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment')

    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = ENV["MICROSOFT_KEY"]
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
    if score < 0.33
      'sad'
    elsif score < 0.66
      'ok'
    else
      'happy'
    end
  end

  def get_image(sentiment)
    response = open('https://pixabay.com/api/?key='+ ENV["PIXA_KEY"] +'&q=' + sentiment + '&image_type=photo').read
    image = JSON.parse(response)
    image["hits"].shuffle.sample["webformatURL"]
  end
end
