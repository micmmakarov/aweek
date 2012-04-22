class CreateRelationshipsTable < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.integer :organisation_id
      t.integer :category_id

      t.timestamps
    end
	

  end

end
