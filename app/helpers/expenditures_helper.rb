module ExpendituresHelper
  
  def no_expenditures(expenditures)
    content_tag('tr', content_tag('td colspan="3"', 'No Expenditures')) if expenditures.empty?
  end
  
  def paid_state(expenditure)
    if expenditure.paid_date?
      content_tag('p class="paid_state"', "This Expenditure is paid since #{expenditure.paid_date}")
    else
      content_tag('p class="paid_state"', "This Expenditure is not paid")
    end
  end
  
  def mark_as_paid(expenditure)
    link_to "mark as paid", :action => 'paid', :id => expenditure.id if expenditure.state < 3
  end
end
