class DaysController < ApplicationController
  before_action set_itinerary, only: [:move_place, :assign_place]

  def assign_place
    if @day.present?
      @day.update("#{params[:day][:tod][1]}_id"=>params[:day][:place_id])
    else
      flash[:alert] = "#{params[:day][:tod]} is already set"
    end
    redirect_to edit_itinerary_path(@itinerary)
  end

  def move_place
    @day.insert_at(params[:position].to_i)
    head :ok
  end

  private
  def set_itinerary
    @itinerary = Itinerary.find(params[:itinerary_id])
    @day = Day.find(params[:day][:day_id])
  end
end
