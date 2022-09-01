module IchiApi
  class Configuration
    attr_accessor :url, :token, :lang

    def initialize
      @url = url
      @token = token
      @lang = lang
    end
  end
end
