class AddThumbnailTitleDescriptionToLongUrl < ActiveRecord::Migration
  def change
    add_column :long_urls, :title, :string
    add_column :long_urls, :description, :string
    add_column :long_urls, :thumbnail, :string
  end
end
