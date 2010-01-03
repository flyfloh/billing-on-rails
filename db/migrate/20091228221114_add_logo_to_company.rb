class AddLogoToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :company_logo, :binary
  end

  def self.down
    remove_column :companies, :company_logo
  end
end
