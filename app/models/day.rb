class Day < ApplicationRecord
  belongs_to :itinerary
  belongs_to :morning, class_name: 'Place', optional: true
  belongs_to :lunch, class_name: 'Place', optional: true
  belongs_to :afternoon, class_name: 'Place', optional: true
  belongs_to :dinner, class_name: 'Place', optional: true
  belongs_to :evening, class_name: 'Place', optional: true
  # acts_as_list

  TOD = ["morning", "lunch", "afternoon", "dinner", "evening"]
end
