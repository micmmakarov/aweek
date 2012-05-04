class AddPublishedToOrganisations < ActiveRecord::Migration
  def change
    add_column :organisations, :published, :boolean
  end
end
