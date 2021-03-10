class DaysController < ApplicationController
  before_action :set_itinerary, only: [:assign_place]
  # before_action :find_day, only: [:move_place]

  def assign_place
    if @day.present?
      @day.update("#{params[:day][:tod][1]}_id"=>params[:day][:place_id])
    else
      flash[:alert] = "#{params[:day][:tod]} is already set"
    end
    redirect_to edit_itinerary_path(@itinerary)
  end

  def move_place
   #retrieve the information from the params
   swapped_item = JSON.parse(params["swappedItem"])
   @swapped_day = Day.find(swapped_item["dayId"].to_i)
   @swapped_tod = swapped_item["daytime"]
   @swapped_place = swapped_item["placeId"] == "" ?  nil : swapped_item["placeId"].to_i

   dragged_item = JSON.parse(params["draggedItem"])
   @dragged_day = Day.find(dragged_item["dayId"].to_i)
   @dragged_tod = dragged_item["daytime"]
   @dragged_place = dragged_item["placeId"] == "" ?  nil : dragged_item["placeId"].to_i
   #the dragged item has the information for the day and daytime that the swapped item needs to get &vv
  #  binding.pry
   @dragged_day.update("#{@dragged_tod}_id": @swapped_place)
   @swapped_day.update("#{@swapped_tod}_id": @dragged_place)
   
    head :ok
# Parameters: {"draggedItem"=>"{\"daytime\":\"afternoon\",\"dayId\":\"2\",\"placeId\":\"32\"}", 
# "swappedItem"=>"{\"daytime\":\"morning\",\"dayId\":\"1\",\"placeId\":\"1\"}"}
  end

  private
  def set_itinerary
    @itinerary = Itinerary.find(params[:itinerary_id])
    @day = Day.find(params[:day][:day_id])
  end

  # def find_day
  #   @day = Day.find(params[:day][:day_id])
  # end
end
