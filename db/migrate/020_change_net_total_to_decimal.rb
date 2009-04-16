class ChangeNetTotalToDecimal < ActiveRecord::Migration
  def self.up
    change_column :expenditures, :net_total, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    change_column :expenditures, :net_total, :float
  end
end
