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

FactoryGirl.define do
  factory :short_url do

  end
end
