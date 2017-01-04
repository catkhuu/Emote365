class CalendarsController < ApplicationController
  def index
    @calendars = current_user.calendars
  end

  def new
  end

  def create
    #if !user.calendars
    # update user profile
    # create calendar
  else

  end
end
