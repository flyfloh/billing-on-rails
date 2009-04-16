class AddTaxPaymentToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :billed_date_relevant, :boolean
  end

  def self.down
    remove_column :companies, :billed_date_relevant
  end
end
