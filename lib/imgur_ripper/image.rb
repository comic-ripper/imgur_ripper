require 'pry'

module ImgurRipper
  class Image
    attr_reader :image_url, :order

    def initialize(image_url:, order:)
      @image_url = image_url
      @order = order
    end

    def to_json(*options)
      as_json.to_json(*options)
    end

    def as_json(*_options)
      {
        JSON.create_id => self.class.name,
        image_url: image_url,
        order: order
      }
    end

    def self.json_create(data)
      new(image_url: data['image_url'], order: data['order'])
    end
  end
end
