Description
-----------
ImageSuckr is a ruby gem that allows you to get random images from Google for seeding purposes.   
In a future it will support other sources.

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

_All [Google Image Search API arguments](http://code.google.com/apis/imagesearch/v1/jsondevguide.html#json_args) are supported and you can use them to filter your results._
    
To get the image content instead of the url:

    suckr.getImage