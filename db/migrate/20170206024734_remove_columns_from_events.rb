class RemoveColumnsFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :city
    remove_column :events, :state
    remove_column :events, :zip_code
  end
end
