class CalendarsController < ApplicationController
  def index
    render :new_calendar_path
  end
end
