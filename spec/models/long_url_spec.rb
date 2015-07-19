require 'rails_helper'

describe LongUrl do
  let!(:valid_url) { FactoryGirl.create(:long_url) }
  let!(:invalid_url) { FactoryGirl.create(:long_url, url: 'google') }

  context 'validations' do
    it { is_expected.to validate_presence_of(:url) }
    it { expect(valid_url.url).to match(/^(ftp|ftps|http|https):\/\/([a-zA-Z0-9]+(\.[a-zA-Z0-9]+)+.*)$/) }
    it { expect(invalid_url.url).not_to match(/^(ftp|ftps|http|https):\/\/([a-zA-Z0-9]+(\.[a-zA-Z0-9]+)+.*)$/) }
  end
end