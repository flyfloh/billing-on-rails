class AddTimeToPayToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :time_to_pay, :integer, :default => 14
  end

  def self.down
    remove_column :companies, :time_to_pay
  end
end
