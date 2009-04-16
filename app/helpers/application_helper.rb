# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def flash_notice
    if flash[:notice]
      content_tag('div', h(flash[:notice]), { :id => "flash_notice" } )
    end
  end
  
  def pretty_state(state)
    return "Open" if state == 0
    return "Billed" if state == 1
    return "Admonished" if state == 2
    return "Paid" if state == 3
  end
  
  def number_to_euro(number)
    number_to_currency number, :unit => "&euro;", :delimiter => ".", :separator => ",", 
      :format => "%n&nbsp;%u"
  end
  
  def to_date(props = {})
    day = props.fetch(:day,1)
    month = props.fetch(:month,1)
    year = props.fetch(:year,1970)
    Time.mktime(year, month, day)
  end
end
