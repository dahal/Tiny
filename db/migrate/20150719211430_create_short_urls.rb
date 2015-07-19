class CreateShortUrls < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.string :uri
      t.belongs_to :long_url
      t.timestamps null: false
    end
  end
end
