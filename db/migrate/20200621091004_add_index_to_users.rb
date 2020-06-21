class AddIndexToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :profile, length: 140
  end
end
