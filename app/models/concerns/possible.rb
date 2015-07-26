module Possible
  extend ActiveSupport::Concern

  module ClassMethods
    def generate!(long_url_id)
      long_url = LongUrl.find(long_url_id)
      possible_uri = Generate.possibles(generate_new_uri)

      possible_uri.each do |uri|
        long_url.short_urls.create(uri: uri)
      end
    end

    private

    def generate_new_uri
      loop do
        uri = SecureRandom.urlsafe_base64(4)
        return uri if !ShortUrl.exists?(uri: uri)
      end
    end
  end
end
