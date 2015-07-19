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

require 'rails_helper'

describe ShortUrl do
  context 'validations' do
    it { is_expected.to validate_presence_of(:uri) }
    it { is_expected.to validate_presence_of(:long_url_id) }
  end

  context 'association' do
    it { is_expected.to belong_to(:long_url) }
  end
end
