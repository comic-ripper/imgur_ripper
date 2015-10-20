require 'dotenv'
require 'simplecov'

Dotenv.load
SimpleCov.start do
  add_filter '/spec/'
end

require 'imgur_ripper'
require 'pry'

# require 'webmock/rspec'
# require 'vcr'

# VCR.configure do |c|
#   c.cassette_library_dir = 'fixtures/vcr_cassettes'
#   c.hook_into :webmock
#   c.configure_rspec_metadata!
# end
