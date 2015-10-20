require 'rest-client'

module ImgurRipper
  class Client
    BASE_URL = 'https://api.imgur.com/3'

    def get(url, **params)
      RestClient.get BASE_URL + url, base_params.merge(params)
    end

    def base_params
      {
        Authorization: "Client-ID #{ImgurRipper.config.client_id}"
      }
    end

    def album_info(album_id)
      get "/album/#{album_id}"
    end
  end
end
