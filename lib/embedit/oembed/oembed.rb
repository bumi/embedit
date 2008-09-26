module Embedit
  
  class Oembed
    
    attr_reader :title, :url, :format, :html
    
    def initialize(url, provider)
      @input_url = url
      get_info(provider)
    end

    def html(size = {})
      if @format == 'photo'                                                                           #Photos use image tags
        @html.insert(-2, " height=#{size[:height]} ") unless size[:height].nil?
        @html.insert(-2, " width=#{size[:width]}") unless size[:width].nil?
      else
        @html.gsub!(/height="\d+"/, %{height="#{size[:height].to_s}"}) unless size[:height].nil?
        @html.gsub!(/width="\d+"/, %{width="#{size[:width].to_s}"}) unless size[:width].nil?
      end
      @html
    end
        
    private    
    
    def get_info(provider)
      oembed_services = Providers.new.sites                   #Load the oEmbed providers - stored in ../providers/yaml
      base_url = prepare_url(oembed_services[provider])       #Prepare the base_url
      url = URI.parse(base_url + @input_url)
      api_data = Net::HTTP.get(url)                           #Get the data
      set_attributes(api_data)
    end
    
    def set_attributes(att)
      parsed_data = JSON.parse(att)                           
      @title = parsed_data['title']
      @url = parsed_data['url'] ||= @input_url
      @format = parsed_data['type']
      @html = @format == 'video' ? parsed_data['html'] : %{<img src='#{@url}' alt='#{@title}'>}   #Image tags
    end
        
    #some urls contain format in the middle of the url
    def prepare_url(url)
      if url.match(/format/)
        return "#{url.gsub(/\{format\}/, 'json')}" + '?url='
      else
        @input_url = @input_url + '&format=json'
        return url + '?url='
      end
    end    
  end
  
end