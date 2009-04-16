class AddTaxToPositions < ActiveRecord::Migration
  def self.up
    add_column :positions, :tax, :integer
  end

  def self.down
    remove_column :positions, :tax
  end
end
