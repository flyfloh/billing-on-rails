class ChangeExpendituresDateToBilledDateAndPaidToPaidDate < ActiveRecord::Migration
  def self.up
    rename_column :expenditures, :date, :billed_date
    rename_column :expenditures, :paid, :paid_date
    change_column :expenditures, :paid_date, :date
  end

  def self.down
    rename_column :expenditures, :billed_date, :date
    rename_column :expenditures, :paid_date, :paid
    change_column :expenditures, :paid, :boolean
  end
end
