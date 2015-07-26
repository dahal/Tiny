require 'rails_helper'

describe LongUrlsController do
  context '#index' do
    subject { get :index }
    
    it { expect(subject).to render_template(layout: :application) }
    it { expect(subject).to render_template(:index) }
  end

  context '#create' do
    context "when the long_url is a valid url" do
      subject {post :create, {long_url: {url: 'http://google.com'}}}
      
      it { expect {subject}.to change(LongUrl, :count).by(1) }
      it { expect {subject}.to change(ShortUrl, :count) }
      it { expect(subject).to redirect_to :root }
    end
    
    context "when the long_url is an invalid url" do
      subject {post :create, {long_url: {url: 'google.com'}}}
    
      it { expect {subject}.to_not change(LongUrl, :count) }
      it { expect {subject}.to_not change(ShortUrl, :count) }
      it { expect(subject).to render_template :new }
    end
  end
end
