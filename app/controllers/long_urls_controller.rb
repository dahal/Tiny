class LongUrlsController < ApplicationController
  before_action :load_new_url, only: [:index, :new]
  
  def index
    @urls = LongUrl.all
  end
  
  def create
    @url = LongUrl.new(url_params)

    respond_to do |format|
      if @url.save
        format.html { redirect_to root_path, flash: { success: 'URL successfully shortened!' } }
      else
        format.html { render :new }
      end
    end
  end
  
  private
  def load_new_url
    @url = LongUrl.new
  end
  
  def url_params
    params.require(:long_url).permit(:url)
  end
end
