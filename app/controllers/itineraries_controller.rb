class ItinerariesController < ApplicationController
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

    private

    def itinerary_params
        params.require(:itinerary).permit(:title, :duration, :city)
    end
    
end
