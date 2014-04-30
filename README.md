Description
---
ImageSuckr is a ruby gem that allows you to get random images from the web for seeding and testing purposes.

By now, only Google is supported as images source.

Installation
---
1. Add `gem 'image_suckr'` to your Gemfile
2. Run `bundle install`

Basic use
---
**Create an ImageSuckr object:**

    suckr = ImageSuckr::GoogleSuckr.new

**To get a fully random image URL:**

    suckr.get_image_url

**To get a random image URL based on a query:**

    suckr.get_image_url({"q" => "car"})

_All [Google Image Search API arguments](http://code.google.com/apis/imagesearch/v1/jsondevguide.html#json_args) are supported and you can use them to filter your results._

**To get the image content instead of the URL:**

    suckr.get_image_content

**To get a file reference to the image:**

    suckr.get_image_file

Other useful examples
---

**To get a [RMagick](http://rmagick.rubyforge.org/) image:**

    image = Magick::Image.from_blob(suckr.get_image_content).first

**To get a [MiniMagick](https://github.com/probablycorey/mini_magick) image:**

    image = MiniMagick::Image.read(suckr.get_image_content)

or

    image = MiniMagick::Image.open(suckr.get_image_url)

**To use with [Paperclip](https://github.com/thoughtbot/paperclip):**

    car.picture = suckr.get_image_file({"q" => "car"})

**To use with [Carrierwave](https://github.com/carrierwaveuploader/carrierwave):**

    car.remote_picture_url = suckr.get_image_url({"q" => "car"})
