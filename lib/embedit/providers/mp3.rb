module Embedit
  
  class Mp3
    
    attr_reader :title, :url, :format
    
    def initialize(url)
      @url = url
    end
    
    def html(options = {})
      options[:width] ||= 275
      options[:height] ||= 50
      options[:player] ||= "/public/mp3.swf"
      options[:preview] ||= ""
      attributes = options.collect {|k,v| "#{k}=\"#{v}\" "}.join("&")
      %{
        <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="#{options[:width]}" height="#{options[:heigth]}" align="middle">
        <param name="allowScriptAccess" value="sameDomain" />
        <param name="movie" value="#{options[:player]}?mp3url=#{@url}&#{attributes}" />
        <param name="quality" value="high" />
        <param name="bgcolor" value="#222222" />
        <embed src="#{options[:player]}?mp3url=#{@url}&#{attributes}" quality="high" width="#{options[:width]}" height="#{options[:height]}" name="mp3" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
      } 
    end
    
    def self.match(url)
      url.match(/(.+\.(mp3)$)/)
    end
  end
  
end