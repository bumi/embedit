module Embedit

  class Youtube
  
    attr_reader :title, :url, :format
  
    def initialize(url)
      @format = 'video'
      @url = url
      get_info
    end
    
    def html(options = {})
      options.reverse_merge({:width=>425,:height=>350})
      %{
        <object width="#{options[:width]}" height="#{options[:height]}">
          <param name="movie" value="http://www.youtube.com/v/#{@video_id}"></param>
          <param name="wmode" value="transparent"></param>
          <embed src="http://www.youtube.com/v/#{@video_id}" 
            type="application/x-shockwave-flash" wmode="transparent" 
            width="#{options[:width]}" height="#{options[:height]}">
          </embed>
        </object>
      }
    end
        
    def self.match(url)
      url.match(/youtube\.com\/watch\?v=(\S+)/xi)
    end
    
    private
    
    def get_info
      video_id = extract_id(@url)
      data = REXML::Document.new(open("http://gdata.youtube.com/feeds/videos/#{video_id}"))
      @title = REXML::XPath.first(data, "//title").text
      @html = video_id
    end
    
    def extract_id(url)
      url.scan(/v=([\w\d]+)/)
    end
  
  end

end
