class Itinerary < ApplicationRecord
  belongs_to :user
  after_save :create_days

  def create_days
    duration.times { Day.create(itinerary: self) }
  end
end
