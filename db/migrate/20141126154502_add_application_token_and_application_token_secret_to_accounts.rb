class AddApplicationTokenAndApplicationTokenSecretToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :application_token, :string
    add_column :accounts, :application_token_secret, :string
  end
end
