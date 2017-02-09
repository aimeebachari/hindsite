class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :review
      t.text :body

      t.timestamps
    end
  end
end
