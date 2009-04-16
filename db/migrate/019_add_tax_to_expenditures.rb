class AddTaxToExpenditures < ActiveRecord::Migration
  def self.up
    add_column :expenditures, :tax, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    remove_column :expenditures, :tax
  end
end
