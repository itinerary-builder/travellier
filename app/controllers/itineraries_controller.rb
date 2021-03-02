class ItinerariesController < ApplicationController
	before_action :set_itinerary, only: [:show, :edit, :update]

	def show
		@itinerary = Itinerary.find(params[:id])
	end

	def edit
		@itinerary = Itinerary.find(params[:id])
	end

	def update
		raise
	end


	private

	def set_itinerary
		@itinerary = Itinerary.find(params[:id])
	end

	def itinerary_params
		params.require(:itinerary).permit(:duration, :city, days_attributes: [:id, :morning, :lunch, :dinner, :afternoon, :evening])
	end


end
