require 'rails_helper'

describe LongUrlsController do
  context '#index' do
    subject { get :index }
    
    it { expect(subject).to render_template(layout: :application) }
    it { expect(subject).to render_template(:index) }
  end

  context '#create' do
    subject { post :create, url: FactoryGirl.create(:long_url) }
    
    it { expect {subject}.to change(LongUrl, :count).by(1) }
    it { expect {subject}.to change(ShortUrl, :count) }
    it { expect(subject).to redirect_to :long_urls }
  end
end
