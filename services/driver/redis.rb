require 'json'
require 'net/http'
require_relative "client"

module Driver
  class Redis
    def self.find_drivers_ids(pickup, n=10)
      driver_ids = []
      (1..n).each do |i|
        random_5digs = self.custom_rand_int() % 100000
        driver_ids << "T7#{random_5digs}C"
      end

      driver_ids
    end

    def self.get_driver(driver_id)
      location = "#{self.custom_rand_int() % 1000}, #{self.custom_rand_int() % 1000}"
      return Driver.new(driver_id=driver_id, location=location)
    end

    def self.custom_rand_int()
      rand(999...10000000)
    end
  end
end
