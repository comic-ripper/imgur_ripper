module ImgurRipper
  class Image
    attr_reader :image_url, :number

    def initialize(image_url:, number:)
      @image_url = image_url
      @number = number
    end

    def image
      @image ||= RestClient.get image_url
    end

    def to_json(*options)
      as_json.to_json(*options)
    end

    def as_json(*_options)
      {
        JSON.create_id => self.class.name,
        image_url: image_url,
        number: number
      }
    end

    def self.json_create(data)
      new(image_url: data['image_url'], number: data['number'])
    end
  end
end
