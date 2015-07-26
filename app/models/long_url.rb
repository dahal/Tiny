# == Schema Information
#
# Table name: long_urls
#
#  id         :integer          not null, primary key
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LongUrl < ActiveRecord::Base
  include UrlDetails

  has_many :short_urls, dependent: :destroy

  validates :url, presence: true
  validates_format_of :url,
    with: /^(ftp|ftps|http|https):\/\/([a-zA-Z0-9]+(\.[a-zA-Z0-9]+)+.*)$/,
    multiline: true,
    on: :create
  
  default_scope  { order(created_at: :desc) }

  after_create :get_url_details, :shortify

  private

  def shortify
    ShortUrl.delay(priority: 1).generate!(self.id)
  end

  def get_url_details
    LongUrl.delay(priority: 0).url_details(self.id)
  end
end
