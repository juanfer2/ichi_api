# frozen_string_literal: true

require_relative "ichi_api/version"
require_relative "ichi_api/configuration"
require_relative "ichi_api/clients/ip_api"
require_relative "ichi_api/user_location"
#require_relative "ichi_api/clients"

module IchiApi
  class << self
    attr_accessor :configuration

    IP_REGEX = /^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/

    def configure
      self.configuration ||= IchiApi::Configuration.new
      yield(configuration)
    end

    def get_location(ip)
      validate_ip(ip)

      IchiApi::UserLocation.new(search_location(ip))
    end

    def search_location(ip)
      validate_ip(ip)

      IchiApi::Clients::IpApi.new(ip, configuration.url, configuration.token).search_location
    end

    def validate_ip(ip)
      raise "ip: #{ip} is invalid" unless ip =~ IP_REGEX
    end
  end
end
