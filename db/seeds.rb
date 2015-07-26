URLS = %w(
  http://github.com/dahal/Tiny
  http://google.com
  http://www.facebook.com
  http://stackoverflow.com/
)


URLS.each do |url|
  LongUrl.create(url: url)
end
