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
		params.require(:itinerary).permit(:title, :duration, :city, days_attributes: [:id, :morning, :lunch, :dinner, :afternoon, :evening])
	end



 
    
end
