class AddStateToExpenditures < ActiveRecord::Migration
  def self.up
    add_column :expenditures, :state, :integer
  end

  def self.down
    remove_column :expenditures, :state
  end
end
