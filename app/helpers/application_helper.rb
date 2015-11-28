module ApplicationHelper
  def restaurant_select
    @restaurants = Restaurant.all
    s = ''
    @restaurants.each do |restaurant|
      s << "<option value=#{restaurant.id}>#{restaurant.name}</option>"
    end
    s.html_safe
  end
end
