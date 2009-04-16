class CreateExpenditures < ActiveRecord::Migration
  def self.up
    create_table :expenditures do |t|
      t.string :bill_id
      t.string :seller
      t.string :name
      t.date :date
      t.float :net_amount
      t.timestamps
    end
  end

  def self.down
    drop_table :expenditures
  end
end
