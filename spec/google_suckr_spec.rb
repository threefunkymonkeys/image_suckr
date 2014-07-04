require File.dirname(__FILE__) + '/../lib/image_suckr'

describe "ImageSuckr" do
  describe "GoogleSuckr" do
    it "should have set the default parameters" do
      image = ImageSuckr::GoogleSuckr.new

      expect(image.default_params).to be_truthy
    end

    it "should have default values" do
      image = ImageSuckr::GoogleSuckr.new

      expect(image.default_params[:rsz]).to be_eql("8")
      expect(image.default_params[:v]).to be_eql("1.0")
    end

    it "should provide access to override default params" do
      params = {:rsz => "6", :v => "1.1", :as_filetype => "png"}
      image = ImageSuckr::GoogleSuckr.new

      expect(image.default_params[:rsz]).to be_eql "8"
      image.default_params = params
      expect(image.default_params[:rsz]).to be_eql "6"
    end

    it "should override the default values" do
      params = {:rsz => "6", :v => "1.1", :as_filetype => "png"}
      image = ImageSuckr::GoogleSuckr.new(params)

      expect(image.default_params[:v]).to be_eql params[:v]
      expect(image.default_params[:rsz]).to be_eql params[:rsz]
    end

    it "should return a valid URL or nil" do
      image = ImageSuckr::GoogleSuckr.new
      expect(open(URI.parse(image.get_image_url))).to be_a(Tempfile).or be_nil
    end

    it "should return a temp file object or nil" do
      image = ImageSuckr::GoogleSuckr.new
      file = image.get_image_file

      expect(file).to be_a(Tempfile).or be_nil
    end

  end
end
