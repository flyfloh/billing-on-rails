class Expenditure < ActiveRecord::Base
  attr_accessor :type_name
  before_save :add_expenditure_type
  belongs_to :expenditure_type
  validates_numericality_of :net_total, :greater_than_or_equal_to => 0
  validates_numericality_of :tax, :greather_than_or_equal_to => 0
  validates_presence_of :bill_id
  validates_presence_of :seller
  validates_presence_of :billed_date
  validates_presence_of :expenditure_type
  
  def self.get_expenditures(props)
    year = props.fetch(:year,0)
    emonth = smonth = props.fetch(:month,0)
    start_state = props.fetch(:start_state)
    end_state = props.fetch(:end_state,start_state)
    order = props.fetch(:order,"billed_date")
    if year != 0
      if smonth == 0
        smonth = 1
        emonth = 12
      end
      start_date = "#{year}-#{smonth}-01 00:00:00"
      end_date = "#{year}-#{emonth}-31 23:59:59"
      
      return find(:all, :conditions => { :state => start_state..end_state, order => start_date..end_date }, :order => order)
    else
      return find(:all, :conditions => { :state => start_state..end_state }, :order => order)
    end
  end
  
  def self.billed(props = {})
    year = props.fetch(:year,0)
    month = props.fetch(:month,0)
    get_expenditures :year => year, :month => month, :start_state => 1, :end_state => 2, :order => 'billed_date'
  end
  
  def self.paid(props = {})
    year = props.fetch(:year,0)
    month = props.fetch(:month,0)
    get_expenditures :year => year, :month => month, :start_state => 3, :order => 'paid_date'
  end
  
  def sales_total
    self.tax
  end
  
  def gross_total
    (self.net_total + self.tax)
  end
  
  def add_expenditure_type
    create_expenditure_type(:title => self.type_name) unless self.type_name.blank?
  end
  
end
