class AddUserIdToClientsAndExpenditures < ActiveRecord::Migration
  def self.up
    add_column :clients, :user_id, :integer
    add_column :expenditures, :user_id, :integer

    add_index :clients, :user_id
    add_index :expenditures, :user_id
  end

  def self.down
    remove_column :clients, :user_id
    remove_column :expenditures, :user_id
  end
end
