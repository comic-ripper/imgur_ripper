require 'rest-client'
require 'uri'

module ImgurRipper
  class Album
    attr_accessor :url

    def self.applies?(url)
      new(url: url).valid?
    end

    def initialize(url:, **_extra)
      url = 'https://' + url if URI.parse(url).scheme.nil?
      @url = URI.parse url
    end

    def album_id
      url.path.match(%r{/a/(\w+)}).try(:"[]", 1)
    end

    def translator
      ''
    end

    def valid?
      (url.hostname.match(/imgur\.com$/) && album_id) ? true : false
    end

    def info
      @info ||= JSON.parse(ImgurRipper.client.album_info(album_id))['data']
    end

    # This can be slow, especially the first time
    def archive
      @archive ||= RestClient.get info['link'] + '/zip'
    end

    def images
      @images ||= info['images'].each_with_index.map do |image, index|
        Image.new(image_url: image['link'], number: index)
      end
    end

    # Ripper protocol
    def number
      0
    end

    def volume
      nil
    end

    def title
      info['title']
    end

    def chapters
      [self]
    end

    def pages
      images
    end

    def to_json(*options)
      as_json.to_json(*options)
    end

    def as_json(*_options)
      {
        JSON.create_id => self.class.name,
        url: url
      }
    end

    def self.json_create(data)
      new(url: data['url'])
    end
  end
end
