class CalendarsController < ApplicationController
  def index
    @user = current_user
    if @user
      @calendars = @user.calendars
      render calendars_path
    else
      require_login
    end
  end

  def new
  end

  def create
  end
end
