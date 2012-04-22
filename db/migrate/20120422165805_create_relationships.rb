class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.integer :organisation_id
      t.integer :category_id

      t.timestamps
    end
	
	add_index :relationships, :follower_id
	add_index :relationships, :followed_id
	add_index :relationships, :organisation_id
	add_index :relationships, :category_id
	add_index :relationships, [:follower_id, :followed_id], unique: true
    add_index :relationships, [:follower_id, :organisation_id], unique: true
    add_index :relationships, [:follower_id, :category_id], unique: true

  end
end
