class AddViewsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :views, :integer
  end
end
