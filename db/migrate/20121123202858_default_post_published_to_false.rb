class DefaultPostPublishedToFalse < ActiveRecord::Migration
  def up
    change_column :posts, :published, :boolean, default: false
  end

  def down
    change_column :posts, :published, :boolean, default: true
  end
end
