class Day < ApplicationRecord
  belongs_to :calendar
  has_many :trends

  validates :calendar, :image_url, :location, presence: true 
end
