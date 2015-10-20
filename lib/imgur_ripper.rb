require 'imgur_ripper/version'
require 'imgur_ripper/configuration'
require 'imgur_ripper/client'
require 'imgur_ripper/album'
require 'imgur_ripper/image'

module ImgurRipper
  def self.parsers
    [
      ImgurRipper::Album
    ]
  end

  def self.config
    @config ||= Configuration.new(
      client_id: ENV['IMGUR_CLIENT_ID'],
      client_secret: ENV['IMGUR_CLIENT_SECRET']
    )
  end

  def self.client
    @client ||= Client.new
  end

  def self.configure(&block)
    config.configure(&block)
  end
end
