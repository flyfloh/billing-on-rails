class RemoveCompanyLogo < ActiveRecord::Migration
  def self.up
    remove_column(:companies, :company_logo)
  end

  def self.down
    add_column :companies, :company_logo, :binary
  end
end
