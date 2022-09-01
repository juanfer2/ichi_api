module IchiApi
  class UserLocation
    attr_accessor :location

    def initialize(location)
      @location ||= location
    end

    def status
      @status ||= location.try(:[], 'status')
    end
  
    def status_success?
      @status_success ||= location.try(:[], 'status') == 'success'
    end
  
    def country
      @country ||= location.try(:[], 'country')
    end
  
    def country_code
      @country_code ||= location.try(:[], 'countryCode')
    end
  
    def city
      @city ||= location.try(:[], 'city')
    end
  
    def city_parameterize
      @city ||= city.parameterize
    end
  
    def latitude
      @latitude ||= location.try(:[], 'lat')
    end
  
    def longitude
      @longitude ||= location.try(:[], 'lon')
    end
  
    def city_origin
      "#{country_code.downcase}-#{city_parameterize}"
    end
  
    def currency
      @currency ||= location.try(:[], 'currency')
    end
  end
end
