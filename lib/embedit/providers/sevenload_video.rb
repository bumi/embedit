module Embedit

  class SevenloadVideo
  
    attr_reader :title, :url, :format
  
    def initialize(url)
      @format = 'video'
      @url = url
      get_info
    end
    
    def html(options = {})
      options.reverse_merge({:width=>425,:height=>350})
      %{
        <object width="425" height="350">
          <param name="wmode" value="transparent"></param>
          <param name="FlashVars" value="slxml=%ssevenload.com"/>
          <param name="movie" value="http://%ssevenload.com/pl/%s/425x350/swf" />
          <embed src="http://%ssevenload.com/pl/%s/425x350/swf" type="application/x-shockwave-flash" width="425" height="350" FlashVars="slxml=%ssevenload.com" wmode="transparent" ></embed>
        </object>
      }
      # % [m[1], m[1], m[3], m[1], m[3], m[1]]
    end
        
    def self.match(url)
      url.match(/([\w|\.]+)sevenload\.\S{2,}\/(videos|videolar|filmy)?\/(\w+)[\/]?([\S]+)/xi)
    end
    
    private
    
    def get_info
      match = self.class.match(@url)
      @lang = match[1]
      
    end
    
  end

end
