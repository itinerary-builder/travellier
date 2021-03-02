class Itinerary < ApplicationRecord
  belongs_to :user
  after_create :create_days
  has_many :days, dependent: :destroy
  accepts_nested_attributes_for :days, allow_destroy: true

  def create_days
    duration.times { Day.create(itinerary: self) }
  end
end
