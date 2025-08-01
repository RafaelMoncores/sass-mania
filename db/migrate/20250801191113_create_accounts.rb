class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :subdomain

      t.timestamps
    end
    add_index :accounts, :subdomain, unique: true
    add_index :accounts, :name, unique: true
  end
end
