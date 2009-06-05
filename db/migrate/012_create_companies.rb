class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.string :tax_no
      t.string :street
      t.string :plz
      t.string :city
      t.string :tel
      t.string :email
      t.string :web
      t.string :account_no
      t.string :bank_code
      t.string :bank
      t.timestamps
    end
    execute "INSERT INTO companies (id,name) VALUES (1,'My first Company');"
  end

  def self.down
    drop_table :companies
  end
end
