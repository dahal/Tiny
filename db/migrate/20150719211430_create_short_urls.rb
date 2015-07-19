class CreateShortUrls < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|

      t.timestamps null: false
    end
  end
end
