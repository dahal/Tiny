class ShortUrl
  module GenerateMultipleUris
    extend ActiveSupport::Concern

    module ClassMethods
      def generate!(long_url_id)
        self.create(uri: generate_new_uri, long_url_id: long_url_id)
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
end
