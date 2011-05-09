require 'net/http' unless defined?(Net::HTTP)
require 'json'     unless defined?(JSON)
require 'open-uri' unless defined?(OpenURI)
require File.dirname(__FILE__) + '/support'  unless "".respond_to? :to_query and [].respond_to? :to_query

module ImageSuckr
  class GoogleSuckr

    DEFAULT_PARAMS = {
      "rsz" => "8",
      #"as_filetype" => "png",
      #"imgc" => "color",
      #"imgcolor" => "black",
      #"imgsz" => "medium",
      #"imgtype" => "photo",
      #"safe" => "active",
      "v" => "1.0"
    }

    def get_image_url(params = {})
      params = DEFAULT_PARAMS.merge(params)
      params["q"] = rand(1000).to_s if params["q"].nil?
      url = "http://ajax.googleapis.com/ajax/services/search/images?" + params.to_query
      resp = Net::HTTP.get_response(URI.parse(url))
      result = JSON.parse(resp.body)
      result["responseData"]["results"][rand(params["rsz"].to_i)]["url"] 
    end

    def get_image_content(params = {})
      Net::HTTP.get_response(URI.parse(get_image_url(params))).body
    end
    
    def get_image_file(params = {})
      open(URI.parse(get_image_url(params)))
    end

  end
end
