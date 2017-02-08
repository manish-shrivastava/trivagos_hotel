class AddAuthenticationTokenToUsers < ActiveRecord::Migration[5.0]
  add_column :users, :authentication_token, :string, limit: 30
  add_index :users, :authentication_token, unique: true
end
