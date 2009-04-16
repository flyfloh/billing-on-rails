class CreateExpenditureTypes < ActiveRecord::Migration
  def self.up
    create_table :expenditure_types do |t|
      t.string :title

      t.timestamps
    end
    add_column :expenditures, :expenditure_type_id, :integer
    add_index :expenditures, :expenditure_type_id
  end

  def self.down
    drop_table :expenditure_types
    remove_index :expenditures
    remove_column :expenditures, :expenditure_type_id
  end
end
