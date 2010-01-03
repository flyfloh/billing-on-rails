class Adduseridtobills < ActiveRecord::Migration
  def self.up
    add_column :bills, :user_id, :integer
    add_index :bills, :user_id
  end

  def self.down
    remove_column :bills, :user_id
  end
end
