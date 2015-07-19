class ShortUrl < ActiveRecord::Base
  belongs_to :long_url
end
