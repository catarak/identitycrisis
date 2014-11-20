class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_name
      t.boolean :is_public

      t.timestamps null: false
    end
  end
end
