module ImgurRipper
  class Configuration
    attr_accessor :client_id, :client_secret

    def initialize(client_id: nil, client_secret: nil)
      @client_id = client_id
      @client_secret = client_secret
    end

    def configure
      yield self
    end
  end
end
