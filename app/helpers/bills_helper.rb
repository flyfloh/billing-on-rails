module BillsHelper

  def no_bills(bills)
    content_tag('tr', content_tag('td colspan="3"', 'No Bills')) if bills.empty?
  end
  
  def close_bill(bill)
    return link_to('close', :action => 'close', :id => bill.id) if bill.state == 0
    return link_to('mark as paid', :action => 'close', :id => bill.id) if bill.state == 1
  end
  
  def destroy_bill(bill)
    return link_to("destroy", bill_path(bill), :method => :delete, :confirm => "Are you sure?")
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
