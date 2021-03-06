# == Schema Information
#
# Table name: short_urls
#
#  id          :integer          not null, primary key
#  uri         :string
#  long_url_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ShortUrl < ActiveRecord::Base
  include Possible

  validates :uri, :long_url_id, presence: true
  validates :uri, uniqueness: true
  belongs_to :long_url
  
  def to_s
    "#{ENV['DOMAIN'] || 'localhost:3000'}/#{uri}"
  end
end
