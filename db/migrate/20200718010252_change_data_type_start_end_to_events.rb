class ChangeDataTypeStartEndToEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :start, :time
    change_column :events, :end, :time
  end
end
