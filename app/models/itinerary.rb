class Itinerary < ApplicationRecord
  belongs_to :user
  after_save :create_days
  has_many :days
  accepts_nested_attributes_for :days, allow_destroy: true

  def create_days
    duration.times { Day.create(itinerary: self) }
  end
end
