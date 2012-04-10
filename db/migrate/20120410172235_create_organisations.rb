class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.text :contacts
      t.text :description
      t.string :city

      t.timestamps
    end
  end
end
