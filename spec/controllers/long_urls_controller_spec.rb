require 'rails_helper'

describe LongUrlsController do
  context '#index' do
    it 'renders application layout' do
      expect(get :index).to render_template(layout: 'application')
    end
    
    it 'renders index template' do
      expect(get :index).to render_template :index
    end
  end

  context '#create' do
    it 'creates new url' do
      expect {
        post :create, url: create(:long_url)
      }.to change(LongUrl, :count).by(1)
    end
  end
end
