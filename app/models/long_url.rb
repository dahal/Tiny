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

  after_create :shortify, :get_url_details

  private

  def shortify
    uri = generate_new_uri
    self.short_urls.create(uri: uri)
    
    ShortUrl.delay(priority: 1).generate_all_possibles!(self.id, uri)
  end

  def get_url_details
    LongUrl.delay(priority: 0).url_details(self.id)
  end
  
  private
  
  def generate_new_uri
    loop do
      uri = SecureRandom.urlsafe_base64(4)
      return uri if !ShortUrl.exists?(uri: uri)
    end
  end
end
