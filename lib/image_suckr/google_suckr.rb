module ImageSuckr
  
  class GoogleSuckr
    attr_accessor :default_params

    def initialize(default_params = {})
      @default_params = {
        :rsz => "8",
        #"as_filetype" => "png",
        #"imgc" => "color",
        #"imgcolor" => "black",
        #"imgsz" => "medium",
        #"imgtype" => "photo",
        #"safe" => "active",
        :v => "1.0"
      }.merge(default_params)
    end

    def get_image_url(params = {})
      params = @default_params.merge(params)
      params["q"] = rand(1000).to_s if params["q"].nil?

      url = "http://ajax.googleapis.com/ajax/services/search/images?" + params.to_query
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri)
      request.initialize_http_header({"User-Agent" => "Ruby"})
      
      response = http.request(request)
      result = JSON.parse(response.body)

      response_data = result["responseData"]
      if response_data.nil?
        sleep(5)
        get_image_url(params) 
      end
      result_size = response_data["results"].count
      result["responseData"]["results"][rand(result_size)]["url"]
    end

    def get_image_content(params = {})
      Net::HTTP.get_response(URI.parse(get_image_url(params))).body
    end
    
    def get_image_file(params = {})
      begin
        open(URI.parse(get_image_url(params)))
      rescue 
        get_image_file(params) 
      end
    end

  end
end
