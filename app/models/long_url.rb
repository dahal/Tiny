class LongUrl < ActiveRecord::Base
  validates :url, presence: true
end
