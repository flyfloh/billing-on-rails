class Client < ActiveRecord::Base
  has_many :bills
  belongs_to :user
  
  validates_presence_of :name
  validates_presence_of :strasse
  validates_length_of :plz, :within => 5..7
  validates_presence_of :ort
  validates_presence_of :email
  validates_presence_of :tel
  
  def full_name
    "#{self.name}, #{self.vorname}"
  end
  
  def billed_bills
    self.bills.find_all { |b| b.state == 1 }
  end

  def admonished_bills
    self.bills.find_all { |b| b.state == 2 }
  end
end
