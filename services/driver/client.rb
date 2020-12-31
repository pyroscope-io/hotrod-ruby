require 'json'
require 'net/http'
require_relative '../config/settings'

module Driver
  class Driver
    def initialize(driver_id, location)
      @driver_id = driver_id
      @location = location
    end
  end

  def self.get_drivers(pickup)
    uri = "http://#{DRIVER_HOST}/find_nearest?pickup=#{pickup}"
    res = Net::HTTP.get(uri)
  
    puts res
    res
  end
end
