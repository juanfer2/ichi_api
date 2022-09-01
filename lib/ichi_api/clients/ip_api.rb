require 'httparty'

module IchiApi
  module Clients
    class IpApi
      attr_accessor :token

      def initialize(ip, url, token)
        @ip = ip
        @url = url
        @token = token
      end
    
      def headers
        {
          'Content-Type': 'application/json'
        }
      end
    
      def url
        link = "#{@url}/json/#{@ip}?fields=#{fields}&lang=es"

        @token ?  "#{link}?key=#{@token}" : link
      end

      def fields
        'currency,status,country,countryCode,region,regionName,city,zip,lat,lon,timezone,isp,' \
        'org,as,query'
      end
    
      def search_location
        HTTParty.get(url, headers: headers).to_hash
      end
    end
  end
end
