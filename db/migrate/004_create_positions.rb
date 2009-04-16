class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.integer :bill_id
      t.string :title
      t.integer :count
      t.integer :eur  #represents the euro value of a single price
      t.integer :cent #represents the cent value of a single price
      t.timestamps
    end
    
    add_index :positions, :bill_id
  end

  def self.down
    drop_table :positions
  end
end
