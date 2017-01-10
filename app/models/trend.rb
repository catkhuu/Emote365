class Trend < ApplicationRecord
  belongs_to :day

  validates :hashtag, :day, presence: true 
end
