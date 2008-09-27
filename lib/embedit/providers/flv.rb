module Embedit
  
  class Player
    
    attr_reader :title, :url, :format
    
    def initialize(url)
      @url = url
    end
    
    def html(options = {})
      options[:width] ||= 400
      options[:height] ||= 300
      options[:player] ||= "/public/swfobject.js"
      %{
        <div class="embeded flv"></div>
        <script type="text/javascript">
          var s1 = new SWFObject("#{options[:player]}","player","#{options[:width]}","#{options[:height]}","9");
          s1.addParam("allowfullscreen","true");
          s1.addParam("allowscriptaccess","always");
          s1.addParam("flashvars","file=#{@url}");
          s1.write("preview");
        </script>
      } 
    end
    
    def self.match(url)
      url.match(/(.+\.(gif|jpg|png)$)/)
    end
  end
  
end