Installation
------------
1. Add `gem 'image_suckr'` to your Gemfile
2. Run `bundle install`
  
Basic use
---------
    suckr = ImageSuckr::GoogleSuckr.new   

To get a fully random image url:   
    
    suckr.getImageUrl
    
To get a random image url based on a query:

    suckr.getImageUrl({"q" => "car"})
    
To get the image content instead of the url:

    suckr.getImage