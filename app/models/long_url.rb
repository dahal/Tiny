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
  has_many :short_urls, dependent: :destroy

  validates :url, presence: true
  validates_format_of :url,
    with: /^(ftp|ftps|http|https):\/\/([a-zA-Z0-9]+(\.[a-zA-Z0-9]+)+.*)$/,
    multiline: true,
    on: :create
end
