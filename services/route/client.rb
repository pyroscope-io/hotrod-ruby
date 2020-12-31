require 'json'
require 'net/http'
require_relative '../config/settings'
require 'uri'

module Route
  class Route
    attr_accessor :pickup, :dropoff, :eta

    def initialize(pickup, dropoff, eta)
      @pickup = pickup
      @dropoff = dropoff
      @eta = eta
    end

    def as_json(options={})
      {
        'pickup' => @pickup,
        'dropoff' => @dropoff,
        'eta' => @eta
      }
    end

    def to_json(*options)
        as_json(*options).to_json(*options)
    end

    def self.create_route_obj(pickup, dropoff)
      eta = rand(2...15)
      return Route.new(pickup, dropoff, eta)
    end
  end

  def self.compute_route(pickup, dropoff)
    uri = URI("http://#{ROUTE_HOST}/route?pickup=#{pickup}&dropoff=#{dropoff}")
    res = Net::HTTP.get(uri)
    route = Route.create_route_obj(pickup, dropoff)

    puts 'inside compute_route', route.to_json

    route.to_json
  end
end
