class DaysController < ApplicationController
  def date
    date = Day.find_by(id: params[:day_id]).date
    render json: date.to_json
  end
end
