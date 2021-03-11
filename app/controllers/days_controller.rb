class DaysController < ApplicationController
  before_action :set_itinerary, only: [:assign_place]

  def assign_place
    if @day.present?
      @day.update("#{params[:day][:tod]}_id"=>params[:day][:place_id])
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
p dragged_item
p @dragged_day
p swapped_item
p @swapped_day
    @dragged_day.update!("#{@dragged_tod}_id": @swapped_place)
    @swapped_day.update!("#{@swapped_tod}_id": @dragged_place)
p "___________________________"
p @dragged_day
p @swapped_day
    head :ok
# Parameters: {"draggedItem"=>"{\"daytime\":\"afternoon\",\"dayId\":\"2\",\"placeId\":\"32\"}", 
# "swappedItem"=>"{\"daytime\":\"morning\",\"dayId\":\"1\",\"placeId\":\"1\"}"}
  end

  private
  def set_itinerary
    @itinerary = Itinerary.find(params[:itinerary_id])
    @day = Day.find(params[:day][:day_id])
  end
end
