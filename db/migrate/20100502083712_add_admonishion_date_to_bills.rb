class AddAdmonishionDateToBills < ActiveRecord::Migration
  def self.up
    add_column :bills, :first_admonishion_date, :date
    add_column :bills, :second_admonishion_date, :date
  end

  def self.down
    remove_column :bills, :first_admonishion_date
    remove_column :bills, :second_admonishion_date
  end
end
