# == Schema Information
#
# Table name: long_urls
#
#  id         :integer          not null, primary key
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :long_url do
    url 'http://example.com'
  end
end
