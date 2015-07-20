class AddIndexToShortUrl < ActiveRecord::Migration
  def change
    add_index :short_urls, :uri, unique: true
  end
end
