class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :place
      t.date :start
      t.date :end
      t.integer :user_id
      t.timestamps
    end
  end
end
