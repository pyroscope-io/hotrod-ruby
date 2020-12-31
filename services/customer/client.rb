require 'json'
require 'net/http'
require_relative '../config/settings'
require 'uri'

module Customer
  class Customer
    attr_accessor :id, :name, :location

    def initialize(id, name, location)
      @id = id
      @name = name
      @location = location
    end

    def as_json(options={})
      {
        'id' => @id,
        'name' => @name,
        'location' => @location
      }
    end

    def to_json(*options)
        as_json(*options).to_json(*options)
    end
  end

  def self.get_customer(customer_id)
    # uri = "http://#{CUSTOMER_HOST}/customer?id=#{customer_id}"
    puts 'inside get customeer'
    uri = URI("http://#{CUSTOMER_HOST}/customer?id=#{customer_id}")
    puts 'build uri', uri
    res = Net::HTTP.get(uri)
    puts res.json, 'customer result'
  end
end
