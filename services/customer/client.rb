require 'json'
require 'net/http'
require_relative '../config/settings'

module Customer
  class Customer
    def initialize(id, name, location)
      @id = id
      @name = name
      @location = location
    end
  end

  def self.get_customer(customer_id)
    uri = "http://#{CUSTOMER_HOST}/customer?id=#{customer_id}"
    res = Net::HTTP.get(uri)
  
    puts res
    res
  end
end
