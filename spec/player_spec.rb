require File.dirname(__FILE__) + '/spec_helper.rb'

describe "JW player tests" do
   
  it "should show false on invalid path" do
    create_media("aslkdh/asd/asdasda").should_not be_valid
  end
      
  it "should show false on invalid url" do
    create_media("http://content.bitsontherun.com/videos/3ta6fhJQ.flv").should be_valid
  end
  
  private
  
  def create_media(url)
    Embedit::Media.new(url)
  end
  
end
