class AddIndexToPosts < ActiveRecord::Migration[6.0]
  def change
    add_index :posts, :content, length: 32
  end
end
