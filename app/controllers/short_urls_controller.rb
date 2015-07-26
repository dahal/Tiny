class ShortUrlsController < ApplicationController
  def redirect
    uri = ShortUrl.find_by(uri: params[:uri])
    redirect_to uri.long_url.url
  end
end
