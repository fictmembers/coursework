module ApplicationHelper
  def restaurant_select
    @restaurants = Restaurant.all
    s = ''
    @restaurants.each do |restaurant|
      s << "<option value=#{restaurant.id}>#{restaurant.name}</option>"
    end
    s.html_safe
  end

  def customer_select
    @customers = Customer.all
    s = ''
    @customers.each do |guest|
      s << "<option value=#{guest.id}>#{guest.LASTNAME}</option>"
    end
    s.html_safe
  end
end
