class ChangePriceToDecimal < ActiveRecord::Migration
  def self.up
    change_column :positions, :price, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    change_column :positions, :price, :float
  end
end
