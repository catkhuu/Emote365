require 'open-uri'

class CalendarsController < ApplicationController
  before_action :find_and_ensure_calendar, only: [:create, :show]

  def index
    @calendars = current_user.calendars
  end

  def new
    if @user.calendars.empty?     #this should be current_user
      render :'welome/update_email'
    else
      render :'new'
    end
  end

  def create
    current_user.update_attributes(email: params[:user][:email]) unless current_user.has_email?
    # binding.pry
    @calendar ||= Calendar.create(user: current_user)
    trending = helpers.top_trends(params[:location]) # FIXME: limit to top 10 tweets
    analysis = helpers.analyze(trending.map { |trend| trend[:name] }.join(' '))
    sentiment = helpers.get_emotions(analysis)
    image_url = helpers.get_image(sentiment)
    day = Day.create(calendar: @calendar, image_url: image_url, location: params[:location].to_s)

    # MODE: Trend.last.split(' ').inject(Hash.new(0)){ |hashtag, freq| hashtag[freq]+=1; hashtag }

    trending.each { |trend| Trend.create(hashtag: trend[:name], day: day) }

    redirect_to calendar_path(@calendar)
  end

  def show
    @days = @calendar.days
    render 'calendars/show'
  end

  private

  def find_and_ensure_calendar
    @calendar = current_user.calendars.first
  end
end
