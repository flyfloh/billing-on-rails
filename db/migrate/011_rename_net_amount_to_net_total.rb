class RenameNetAmountToNetTotal < ActiveRecord::Migration
  def self.up
    rename_column(:expenditures, :net_amount, :net_total)
  end

  def self.down
    rename_column(:expenditures, :net_total, :net_amount)
  end
end
