require 'json'
require 'net/http'
require_relative '../config/settings'
require 'uri'

module Route
  class Route
    def initialize(pickup, dropoff, eta)
      @pickup = pickup
      @dropoff = dropoff
      @eta = eta
    end
  end

  def self.compute_route(pickup, dropoff)
    uri = URI("http://#{ROUTE_HOST}/route?pickup=#{pickup}&dropoff=#{dropoff}")
    res = Net::HTTP.get(uri)
  
    puts res
    { 'pickup' => "1234", 'dropoff' => '1234', 'eta' => 100}
  end
end
