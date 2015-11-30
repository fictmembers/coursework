module ItemsHelper
  def cuisine_select
    @cusines = Menu.all
    s = ''
    @cusines.each do |cuisine|
      s << "<option value=#{cuisine.id}>#{cuisine.cuisine}</option>"
    end
    s.html_safe
  end
end
