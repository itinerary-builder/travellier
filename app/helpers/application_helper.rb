module ApplicationHelper
  def find_icon(category)
        case category
        when "Museums"
          "<i class='fas fa-archway btn-icon btn-icon-green'></i>"
        when "Landmarks"
          "<i class='fas fa-map-signs btn-icon btn-icon-red'></i>"
        when "Activities"
          "<i class='fas fa-hiking btn-icon btn-icon-blue'></i>"
        when "Restaurants"
          "<i class='fas fa-glass-martini-alt btn-icon btn-icon-yellow'></i>"
        else
          "<i></i>"
        end
  end
end
