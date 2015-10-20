require 'spec_helper'

RSpec.describe ImgurRipper::Album do
  let(:album_url) { 'https://imgur.com/a/2kqoy' }
  it 'gets images' do
    ImgurRipper::Album.new(url: album_url).images
  end
end
