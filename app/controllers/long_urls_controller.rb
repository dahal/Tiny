class LongUrlsController < ApplicationController
  before_action :load_new_url, only: [:index, :new]
  
  def index
    @urls = LongUrl.all
  end
  
  def create
    require "pry"; binding.pry
    redirect_to :long_urls
  end
  
  private
  def load_new_url
    @url = LongUrl.new
  end
end
