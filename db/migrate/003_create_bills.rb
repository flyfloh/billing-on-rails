class CreateBills < ActiveRecord::Migration
  def self.up
    create_table :bills do |t|
      t.integer :client_id
      t.string :title
      t.integer :state
      t.timestamps
    end
    
    add_index :bills, :client_id
  end

  def self.down
    drop_table :bills
  end
end
