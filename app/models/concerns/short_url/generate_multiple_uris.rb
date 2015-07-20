class ShortUrl
  module GenerateMultipleUris
    extend ActiveSupport::Concern

    module ClassMethods
      def generate!(long_url_id)
        self.create(uri: SecureRandom.urlsafe_base64(4), long_url_id: long_url_id)
      end
    end
  end
end
