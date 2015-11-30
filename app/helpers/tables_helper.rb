module TablesHelper
  def waiter_select
    waiter = Waiter.all

    s = ''
    waiter.each do |w|
      s << "<option value=#{w.id}>#{w.lastname}</option>"
    end
    s.html_safe
  end
end
