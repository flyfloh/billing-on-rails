class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :name
      t.string :vorname
      t.string :firma
      t.string :strasse
      t.string :plz
      t.string :ort
      t.string :tel
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
