module ApplicationHelper
  def shortifed(url)
    url.short_urls.first
  end
end
