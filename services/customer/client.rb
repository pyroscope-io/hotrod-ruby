require 'json'
require 'net/http'
require_relative '../config/settings'
require 'uri'

module Customer
  class Customer
    def initialize(id, name, location)
      @id = id
      @name = name
      @location = location
    end
  end

  def self.get_customer(customer_id)
    # uri = "http://#{CUSTOMER_HOST}/customer?id=#{customer_id}"
    puts 'inside get customeer'
    uri = URI("http://#{CUSTOMER_HOST}/customer?id=#{customer_id}")
    puts 'build uri', uri
    res = Net::HTTP.get(uri)
  
    puts res, 'result'
    res
  end
end
