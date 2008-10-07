module Embedit
  
  class Flv
    
    attr_reader :title, :url, :format
    
    def initialize(url)
      @url = url
      @format = "video"
    end
    
    def html(options = {})
      options[:width] ||= 400
      options[:height] ||= 300
      options[:player] ||= "/public/flvplayer.swf"
      options[:preview] ||= ""
      %{
        <embed width="#{options[:width]}" height="#{options[:height]}" flashvars="file=#{@url}&amp;image=#{options[:preview]}&amp;width=#{options[:width]}&amp;height=#{options[:height]}" allowfullscreen="true" quality="high" name="single" style="" src="#{options[:player]}" type="application/x-shockwave-flash"/>
      } 
    end
    
    def self.match(url)
      url.match(/(.+\.flv$)/)
    end
  end
  
end