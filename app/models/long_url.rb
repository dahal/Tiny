class LongUrl < ActiveRecord::Base
  validates :url, presence: true
  validates_format_of :url,
                      with: /^(ftp|ftps|http|https):\/\/([a-zA-Z0-9]+(\.[a-zA-Z0-9]+)+.*)$/,
                      multiline: true,
                      on: :create

  has_many :short_urls, dependent: :destroy
end
