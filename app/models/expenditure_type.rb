class ExpenditureType < ActiveRecord::Base
  has_many :expenditures
  
  def find_expenditures(props = {})
    year = props.fetch(:year, 0)
    month = props.fetch(:month, 0)
    billed = props.fetch(:billed)
      if billed
        state = [1,2]
        date_field = :billed_date
      else
        state = 3
        date_field = :paid_date
      end
    # set the date column to request and the states to request
    # build start and end dates according to props
    if month == 0
      start_date = Time.mktime(year,1,1,0,0)
      end_date = Time.mktime(year, 12,31,23,59)
    else
      start_date = Time.mktime(year,month,1,0,0)
      end_date = Time.mktime(year, month,31,23,59)
    end
    # if no year was specified return all expenditures
    if year == 0
      self.expenditures
    else
      self.expenditures.find(:all, :conditions => {date_field => start_date..end_date, :state => state})
#      date_select(:paid_date, :start_date => year)
    end
    
  end
  
end
