class LongUrlsController < ApplicationController
  def index
    @urls = LongUrl.all
  end
  
  def create
    redirect_to :long_urls
  end
end
