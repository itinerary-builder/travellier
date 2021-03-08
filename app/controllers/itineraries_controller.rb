class ItinerariesController < ApplicationController

	before_action :set_itinerary, only: [:show, :edit, :update]

	def new
	   @itinerary=Itinerary.new
	end

	def create
    @itinerary = Itinerary.new(itinerary_params)
     @itinerary.user = current_user
    if @itinerary.save
        redirect_to edit_itinerary_path(@itinerary)
    else
        render :new
    end
	end

	def show
		@itinerary = Itinerary.find(params[:id])
		@places = Place.all
	end

	def edit
		@itinerary = Itinerary.find(params[:id])
		@places = Place.all
		@filtered_places = Place.all
		if params[:filter].present?
			@filtered_places = @places.where(category: params[:filter])
		end
		if params[:filter].present?
			@markers = @filtered_places.map do |place|
				{
					lat: place.lat,
					lng: place.lng,
					infoWindow: render_to_string(partial: "info_window", locals: { place: place }),
					category: place.category
				}
			end 
		else
			@markers = @places.map do |place|
				{
					lat: place.lat,
					lng: place.lng,
					infoWindow: render_to_string(partial: "info_window", locals: { place: place }),
					category: place.category
				}
			end
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
