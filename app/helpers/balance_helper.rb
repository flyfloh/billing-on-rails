module BalanceHelper
  
  def header_date(year,month)
    if month == 0
      year
    else
      to_date(:year => year, :month => month).strftime("%B %Y")
    end
  end
  
  def net_total(bills)
    bills.sum { |bill| bill.net_total }
  end
  
  def sales_total(bills)
   bills.sum { |bill| bill.sales_total }
  end
 
  def gross_total(bills)
    bills.sum { |bill| bill.gross_total }
  end
  
  def net_balance(income, expenditures)
    net_total(income)-net_total(expenditures)
  end
  
  def sales_balance(income, expenditures)
    sales_total(income)-sales_total(expenditures)
  end
  
  def gross_balance(income, expenditures)
    gross_total(income)-gross_total(expenditures)
  end

  def earned(income,expenditures)
    net_total(income)+sales_total(income)+sales_total(expenditures)
  end
  
  def expended(income,expenditures)
    net_total(expenditures)+sales_total(expenditures)+sales_total(income)
  end
  
  def previous_month(month,year)
    month = month.to_i
    year = year.to_i
    if month <= 1
      year -= 1
      month = 12
    else
      month -= 1
    end
    return [month, year]
  end
  
  def next_month(month, year)
    month = month.to_i
    year = year.to_i
    if month >= 12
      year += 1
      month = 1
    else
      month += 1
    end
    return [month, year]
  end

end
