class ShortUrlsController < ApplicationController
  def redirect
    uri = ShortUrl.find_by(uri: params[:uri])
    
    if uri.present?
      redirect_to uri.long_url.url
    else
      render 'errors/show', status: 404
    end
  end
end
