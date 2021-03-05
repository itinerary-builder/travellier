class ItinerariesController < ApplicationController

	before_action :set_itinerary, only: [:show, :edit, :update]

	def new
	   @itinerary=Itinerary.new
	end

	def create
    @itinerary = Itinerary.new(itinerary_params)
     @itinerary.user = current_user
    if @itinerary.save
        redirect_to itinerary_path(@itinerary)
    else
        render :new
    end
	end

	def show
		@itinerary = Itinerary.find(params[:id])
	end

	def edit
		@places = Place.all
		@itinerary = Itinerary.find(params[:id])
		@markers = @places.map do |place|
      {
        lat: place.lat,
        lng: place.lng,
				infoWindow: render_to_string(partial: "info_window", locals: { place: place }),
				category: place.category
      }
    end
	end

	def update
		if @itinerary.update(itinerary_params)
			redirect_to request.referrer
		else
			render :edit
		end
	end

	private

	def set_itinerary
		@itinerary = Itinerary.find(params[:id])
	end

	def itinerary_params
		params.require(:itinerary).permit(:title, :duration, :city, :completed, days_attributes: [:id, :morning_id, :lunch_id, :dinner_id, :afternoon_id, :evening_id])
	end
end
