module Possible
  extend ActiveSupport::Concern

  module ClassMethods
    def generate_all_possibles!(long_url_id, short_uri)
      long_url = LongUrl.find(long_url_id)
      possible_uri = Generate.possibles(short_uri)

      possible_uri.each do |uri|
        long_url.short_urls.create(uri: uri)
      end
    end
  end
end
