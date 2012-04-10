class AddPicToAttachments < ActiveRecord::Migration
 def self.up
    change_table :attachments do |t|
      t.has_attached_file :pic
    end
  end

  def self.down
    drop_attached_file :attachments, :pic
  end
end