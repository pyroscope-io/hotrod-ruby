require 'json'
require 'net/http'
require_relative '../config/settings'
require 'uri'

module Driver
  class Driver
    def initialize(driver_id, location)
      @driver_id = driver_id
      @location = location
    end
  end

  def self.get_drivers(pickup)
    uri = URI("http://#{DRIVER_HOST}/find_nearest?pickup=#{pickup}")
    res = Net::HTTP.get(uri)
  
    puts res
    [ { 'driver_id' => "1234", 'location' => '1234'} ]
  end
end
