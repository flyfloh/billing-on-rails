class User < ActiveRecord::Base
  acts_as_authentic

  has_one :company
  has_many :bills
end
