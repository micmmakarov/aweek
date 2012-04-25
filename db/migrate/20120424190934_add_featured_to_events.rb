class AddFeaturedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :featured, :boolean
    add_column :events, :published, :boolean
  end
end
