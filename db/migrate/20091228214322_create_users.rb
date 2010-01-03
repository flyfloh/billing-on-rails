class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token

      t.timestamps
    end

    add_column :companies, :user_id, :integer
    # Careful this removes your company
    execute "DELETE FROM companies;"
  end

  def self.down
    raise "This Migration is not revertable."
  end
end
