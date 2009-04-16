class AddPaymentToBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :payment, :string
  end

  def self.down
    remove_column :bills, :payment
  end
end
