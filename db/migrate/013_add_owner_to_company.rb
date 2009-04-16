class AddOwnerToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :owner, :string
  end

  def self.down
    remove_column :companies, :owner
  end
end
