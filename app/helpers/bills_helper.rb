module BillsHelper

  def no_bills(bills)
    content_tag('tr', content_tag('td colspan="3"', 'No Bills')) if bills.empty?
  end
  
  def admonish_bill(bill)
    unless bill.state == 3 || !bill.second_admonishion_date.nil?
      content_tag 'li', link_to("admonish", admonish_bill_path(bill), :method => :post)
    end
  end

  def close_bill(bill)
    if bill.state == 0
      text = "close" if bill.state == 0
    else
      text = image_tag("icons/accept.png") + " mark as paid"
    end
    return content_tag 'li', link_to(text, close_bill_path(bill), :method => :post) unless bill.state == 3
  end
  
  def destroy_bill(bill)
    return link_to(image_tag("icons/delete.png") + " destroy", bill_path(bill), :method => :delete, :confirm => "Are you sure?")
  end
  
  def bill_state(bill)
    return 'class="open_bills"' if bill.state == 0
    return 'class="billed_bills"' if bill.state == 1
    return 'class="admonished_bills"' if bill.state == 2
    return 'class="paid_bills"' if bill.state == 3
  end

  def tax(bill)
    taxes = bill.tax_to_h
    str = ''
    taxes.each{ |key, value| str << "<p><b>zzgl. #{key}% MwSt:</b>&nbsp;#{number_to_euro value}</p>" }
    return str
  end

end
