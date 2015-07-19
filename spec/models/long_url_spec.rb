require 'rails_helper'

describe LongUrl do
  let(:valid_url) { FactoryGirl.create(:long_url) }

  context 'validations' do
    it { is_expected.to validate_presence_of(:url) }
    it { expect(valid_url.url).to match(/^(ftp|ftps|http|https):\/\/([a-zA-Z0-9]+(\.[a-zA-Z0-9]+)+.*)$/) }
    it { expect{ FactoryGirl.create(:long_url, url: 'google.com') }.to raise_error(ActiveRecord::RecordInvalid) }
  end

  context 'associations' do
    it { is_expected.to have_many(:short_urls).dependent(:destroy) }
  end
end
