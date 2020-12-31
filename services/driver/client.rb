require 'json'
require 'net/http'
require_relative '../config/settings'
require 'uri'
require 'json'

module Driver
  class Driver
    attr_accessor :driver_id, :location

    def initialize(driver_id, location)
      @driver_id = driver_id
      @location = location
    end

    def as_json(options={})
      {
        'driver_id' => @driver_id,
        'location' => @location,
      }
    end

    def to_json(*options)
        as_json(*options).to_json(*options)
    end
  end

  def self.get_drivers(pickup)
    uri = URI("http://#{DRIVER_HOST}/find_nearest?pickup=#{pickup}")
    res = Net::HTTP.get(uri)
    drivers = JSON.parse(res)
    
    drivers
  end
end
