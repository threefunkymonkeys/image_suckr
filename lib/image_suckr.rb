require 'net/http' unless defined?(Net::HTTP)
require 'json'     unless defined?(JSON)
require 'open-uri' unless defined?(OpenURI)
require File.dirname(__FILE__) + '/support'  unless "".respond_to? :to_query and [].respond_to? :to_query

require './lib/image_suckr/google_suckr'

module ImageSuckr
  
  class << self
  end
end
