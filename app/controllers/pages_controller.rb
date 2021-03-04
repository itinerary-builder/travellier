class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @itinerary = Itinerary.new
  end

  def profile
    @completed = current_user.itineraries.where(completed: true)
    @upcoming = current_user.itineraries.where(completed: false)
  end
end
