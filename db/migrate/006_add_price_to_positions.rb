class AddPriceToPositions < ActiveRecord::Migration
  def self.up
    add_column :positions, :price, :float
    remove_column :positions, :eur
    remove_column :positions, :cent
  end

  def self.down
    add_column :positions, :eur, :integer
    add_column :positions, :cent, :integer
    remove_column :positions, :price
  end
end
