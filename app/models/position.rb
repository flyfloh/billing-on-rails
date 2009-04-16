class Position < ActiveRecord::Base
  belongs_to :bill
  validates_presence_of :title
  validates_numericality_of :count, :greater_than => 0
  validates_numericality_of :price, :greater_than_or_equal_to => 0
  validates_numericality_of :tax, :less_than_or_equal_to => 100
  
  def net_total
    self.price * self.count
  end
  
  def tax_total
    (self.net_total*self.tax.to_f/100.to_f)
  end
  
  def gross_total
    (self.net_total+self.tax_total)
  end
end
