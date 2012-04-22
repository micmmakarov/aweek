class AddCategoryIdToOrganisations < ActiveRecord::Migration
  def change
    add_column :organisations, :category_id, :integer
  end
end
