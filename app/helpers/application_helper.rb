# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def company_logo(company_logo)
    content_tag :div, :class => "company_logo" do
      if company_logo
        image_tag(company_logo_path(company_logo), :alt => "Company Logo")
      else
        image_tag("icons/user_suit.png", :alt => "Dummy Company Logo")
      end
    end
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def flash_notice
    if flash[:notice]
      close = link_to_remote image_tag("icons/cross.png", :style => "position:absolute;right:50px;top:7px;"), :complete => visual_effect(:Fade,"flash_notice", :duration => 3.0)
      content_tag('div', h(flash[:notice]) + close, { :id => "flash_notice" })
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

  def pretty_date(date)
    to_date(:year => date.year, :month => date.month, :day => date.day)
  end
end
