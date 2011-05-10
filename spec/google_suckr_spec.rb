require File.dirname(__FILE__) + '/../lib/image_suckr'

describe "ImageSuckr" do
  describe "GoogleSuckr" do
    it "should have set the default parameters" do
      image = ImageSuckr::GoogleSuckr.new

      image.default_params.should_not be_nil
    end

    it "should have default values" do
      image = ImageSuckr::GoogleSuckr.new

      image.default_params[:rsz].should be_eql("8")
      image.default_params[:v].should be_eql("1.0")
    end

    it "should provide access to override default params" do
      params = {:rsz => "6", :v => "1.1", :as_filetype => "png"}
      image = ImageSuckr::GoogleSuckr.new
      
      image.default_params[:rsz].should be_eql "8"
      image.default_params = params
      image.default_params[:rsz].should be_eql "6"
    end

    it "should override the default values" do
      params = {:rsz => "6", :v => "1.1", :as_filetype => "png"}
      image = ImageSuckr::GoogleSuckr.new(params)
      
      image.default_params[:v].should be_eql params[:v]
      image.default_params[:rsz].should be_eql params[:rsz]
    end

    it "should return a valid URL" do
      image = ImageSuckr::GoogleSuckr.new
      open(URI.parse(image.get_image_url)).should be_a Tempfile
    end

    it "should return a temp file object" do
      image = ImageSuckr::GoogleSuckr.new
      file = image.get_image_file

      file.should be_a Tempfile
    end

  end
end
