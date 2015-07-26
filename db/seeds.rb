URLS = %w(
  http://github.com/dahal/Tiny
  http://google.com
  http://www.facebook.com
  http://www.twitter.com
)


URLS.each do |url|
  LongUrl.create(url: url)
end
