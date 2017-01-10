class Calendar < ApplicationRecord
  belongs_to :user
  has_many :days

  validates :user, :days, presence: true 
end
