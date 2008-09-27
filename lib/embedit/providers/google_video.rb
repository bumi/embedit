module Embedit

  class GoogleVideo
  
    attr_reader :title, :url, :format
  
    def initialize(url)
      @url = url
    end
    def self.match(url)
    end
  end

end
