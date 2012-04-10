class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.datetime :date
      t.integer :user_id
      t.integer :organisation_id
      t.string :address

      t.timestamps
    end
  end
end
