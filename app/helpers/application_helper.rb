module ApplicationHelper
  def restaurant_select
    @restaurants = Restaurant.where(lang:I18n.locale)
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
      s << "<option value=#{guest.id}>#{guest.lastname}</option>"
    end
    s.html_safe
  end

  def lang_switcher
    content_tag(:ul, class: 'lang-switcher clearfix') do
      I18n.available_locales.each do |loc|
        locale_param = request.path == root_path ? root_path(locale: loc) : params.merge(locale: loc)
        concat content_tag(:li, (link_to loc, locale_param), class: (I18n.locale == loc ? "active" : ""))
      end
    end
  end
end
