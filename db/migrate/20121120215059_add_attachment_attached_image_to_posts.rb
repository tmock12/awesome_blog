class AddAttachmentAttachedImageToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.has_attached_file :attached_image
    end
  end

  def self.down
    drop_attached_file :posts, :attached_image
  end
end
