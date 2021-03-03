class DaysController < ApplicationController
  def assign_place
    @itinerary = Itinerary.find(params[:itinerary_id])
    @day = @itinerary.days.find_by("#{params[:tod]}_id" => nil)
    if @day.present?
      @day.update("#{params[:tod]}_id"=>params[:place_id])
    else
      flash[:alert] = "#{params[:tod]} is already set"
    end
    redirect_to edit_itinerary_path(@itinerary)
  end
end
