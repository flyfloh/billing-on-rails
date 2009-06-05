module ExpendituresHelper
  
  def no_expenditures(expenditures)
    content_tag('tr', content_tag('td colspan="3"', 'No Expenditures')) if expenditures.empty?
  end
  
end
