class Bill < ActiveRecord::Base
  validates_presence_of :client
  has_many :positions
  belongs_to :client
  belongs_to :user
  
  # this class represents a bill
  
  def self.get_bills(props = {})
    #get all bills
    year = props.fetch(:year,0)
    end_month = start_month = props.fetch(:month,0)
    start_state = props.fetch(:start_state,0)
    end_state = props.fetch(:end_state,start_state)
    order = props.fetch(:order,"id")
    search = props.fetch(:search, "")
    if search.blank?
      if year != 0
        if start_month == 0
          start_month = 1
          end_month = 12
        end
        start_date = "#{year}-#{start_month}-01 00:00:00"
        end_date = "#{year}-#{end_month}-31 23:59:59"

        return find(:all, :conditions => { :state => start_state..end_state, order => start_date..end_date }, :order => order)
      else
        return find(:all, :conditions => { :state => start_state..end_state }, :order => order)
      end
    else
      find(:all, :conditions => ["title LIKE ?", '%' + search + '%'])
    end
    
  end

  def self.open_bills(props = {})
    #get all open bills
    year = props.fetch(:year,0)
    month = props.fetch(:month,0)
    Bill.get_bills :year => year, :month => month, :start_state => 0, :order => 'created_at'
  end
  
  def self.closed_bills(props = {})
    # gets all bills which have been sent out, but not yet paid
    year = props.fetch(:year,0)
    month = props.fetch(:month,0)
    Bill.get_bills :year => year, :month => month, :start_state => 1, :end_state => 2, :order => 'billed_date'
  end
  
  def self.paid_bills(props = {})
    # get all paid bills
    year = props.fetch(:year,0)
    month = props.fetch(:month,0)
    Bill.get_bills :year => year, :month => month, :start_state => 3, :order => 'paid_date'
  end
  
  def net_total
    # returns the net total of one bill
    total = 0
    for position in self.positions
      total+=position.net_total
    end
    return total
  end
  
  def sales_total
    sales = 0
    for pos in self.positions
      sales += pos.tax_total
    end
    return sales
  end
  
  def gross_total
    # returns the gross total of the bill
    return net_total+sales_total
  end
  
  def state_str
    # returns the state of a bill as a string
    # TODO: i might wanna find a better way to do this
    return 'Open' if self.state == 0
    return "Billed since #{self.billed_date.strftime("%d.%m.%Y")}" if self.state == 1
    if self.state == 2
      if self.second_admonishion_date.nil?
        return "Admonished once on #{self.first_admonishion_date.strftime("%d.%m.%Y")}"
      else
        return "Admonished twice, last on #{self.second_admonishion_date.strftime("%d.%m.%Y")}"
      end
    end
    return "Paid since #{self.paid_date}" if self.state == 3
    return "Deleted" if self.state == 10
    return 'Unknown'
  end
  
  def date
    unless self.billed_date.nil?
      self.billed_date.strftime("%d.%m.%Y")
    else
      "Not Billed Yet!"
    end
  end
  
  def tax_to_h
    taxes = {}
    for pos in self.positions
      if pos.tax != 0
        if taxes.has_key?(pos.tax)
          # add amount of tax to hash
          t = taxes[pos.tax]
          t = t + pos.tax_total
          taxes[pos.tax] = t
        else
          # add new tax to hash
          taxes[pos.tax] = pos.tax_total
        end
      end
    end
    return taxes
  end
  
end
