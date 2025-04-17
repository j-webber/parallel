class Guest < ApplicationRecord
  belongs_to :user
  has_many :parking_passes
end
