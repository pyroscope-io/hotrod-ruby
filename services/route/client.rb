require 'json'
require 'net/http'
require_relative '../config/settings'

module Route
  class Route
    def initialize(pickup, dropoff, eta)
      @pickup = pickup
      @dropoff = dropoff
      @eta = eta
    end
  end

  def self.compute_route(pickup, dropoff)
    uri = "http://#{ROUTE_HOST}/route?pickup=#{pickup}&dropoff=#{dropoff}"
    res = Net::HTTP.get(uri)
  
    puts res
    res
  end
end
