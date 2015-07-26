class LongUrl
  module UrlDetails
    extend ActiveSupport::Concern

    module ClassMethods
      def url_details(id)
        long_url = LongUrl.find(id)
        link = LinkThumbnailer.generate(long_url.url)

        long_url.update_attributes(
          title: link.title,
          thumbnail: link.images.first.src.to_s,
          description: link.description
        )
      end
    end
  end
end
