class ChangeCountToFloat < ActiveRecord::Migration
  def self.up
    change_column :positions, :count, :float
  end

  def self.down
    change_column :positions, :count, :integer
  end
end
