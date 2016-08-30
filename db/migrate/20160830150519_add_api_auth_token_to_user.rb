class AddApiAuthTokenToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :api_auth_token, :string, limit: 20

    add_index :users, :api_auth_token, unique: true
  end
end
