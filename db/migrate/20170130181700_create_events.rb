class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.text :description, null: false
      t.string :image, default: ""
      t.belongs_to :user

      t.timestamps
    end
  end
end
