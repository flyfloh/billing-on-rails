class AddPaidDateAndBilledDateToBill < ActiveRecord::Migration
  def self.up
    add_column :bills, :paid_date, :date
    add_column :bills, :billed_date, :date
  end

  def self.down
    remove_column :bills, :billed_date
    remove_column :bills, :paid_date
  end
end
