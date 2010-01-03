class CreateCompanyLogos < ActiveRecord::Migration
  def self.up
    create_table :company_logos do |t|
      t.integer :company_id
      t.string :content_type

      t.binary :data

      t.timestamps
    end

    add_index :company_logos, :company_id
  end

  def self.down
    drop_table :company_logos
  end
end
