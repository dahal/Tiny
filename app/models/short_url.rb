class ShortUrl < ActiveRecord::Base
  validates :uri, :long_url_id , presence: true
  belongs_to :long_url
end
