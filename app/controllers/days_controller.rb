class DaysController < ApplicationController
  def assign_place
    @itinerary = Itinerary.find(params[:itinerary_id])
    @day = Day.find(params[:day][:day_id])
    if @day.present?
      @day.update("#{params[:day][:tod]}_id"=>params[:day][:place_id])
    else
      flash[:alert] = "#{params[:day][:tod]} is already set"
    end
    redirect_to edit_itinerary_path(@itinerary)
  end

  def move_place
    
  end
end
