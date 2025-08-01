class CreateMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.string :role, default: 'member', null: false

      t.timestamps
    end
    add_index :memberships, [:user_id, :account_id], unique: true
  end
end
