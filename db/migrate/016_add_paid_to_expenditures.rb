class AddPaidToExpenditures < ActiveRecord::Migration
  def self.up
    add_column :expenditures, :paid, :boolean
  end

  def self.down
    remove_column :expenditures, :paid
  end
end
