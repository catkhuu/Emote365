class Day < ApplicationRecord
  belongs_to :calendar
  has_many :trends
  attr_reader :date

  validates :calendar, :image_url, :location, presence: true

  def date
    self.created_at.strftime("%A, %b %e, %Y")
  end
end
