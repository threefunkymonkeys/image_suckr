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

    def getImageUrl(params = {})
      params = DEFAULT_PARAMS.merge(params)
      params["q"] = rand(1000).to_s if params["q"].nil?
      url = "http://ajax.googleapis.com/ajax/services/search/images?" + params.to_query
      resp = Net::HTTP.get_response(URI.parse(url))
      result = JSON.parse(resp.body)
      imageUrl = result["responseData"]["results"][rand(params["rsz"].to_i)]["url"] 
    end

    def getImage(params = {})
      image = Net::HTTP.get_response(URI.parse(getImageUrl(params))).body
    end

  end
end
