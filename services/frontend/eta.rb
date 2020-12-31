require_relative '../customer/client'
require_relative '../driver/client'
require_relative '../route/client'
require_relative 'client'
require 'json'


module Frontend
  class Eta
    def self.get_best_eta(customer_id)
      customer = Customer.get_customer(customer_id)
      puts 'customer', customer
      drivers = Driver.get_drivers(customer['location'])

      best_eta = -1
      best_driver = nil

      drivers.each do |driver|
        route = Route.compute_route(customer['location'], driver['location'])
        parsed_route = JSON.parse(route)
        puts "Eta: #{parsed_route["eta"]}"
        puts "Eta2: #{parsed_route}"
        if (parsed_route['eta'] < best_eta) || !best_driver
          best_driver = driver['driver_id']
          best_eta = parsed_route['eta']
        end
      end

      BestDriver.new(best_driver, best_eta).to_json
    end
  end
end
