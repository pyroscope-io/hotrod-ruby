require_relative '../customer/client'
require_relative '../driver/client'
require_relative '../route/client'
require_relative 'client'


module Frontend
  class Eta
    def self.get_best_eta(customer_id)
      customer = Customer::Customer.get_customer(customer_id)
      drivers = Driver::Driver.get_drivers(customer.location)

      best_eta = -1
      best_driver = nil

      drivers.each do |driver|
        route = Route::Route.compute_route(customer[:location], driver[:location])

        if (route[:eta] < best_eta) || !best_driver
          best_driver = driver[:driver_id]
          best_eta = route[:eta]
        end
      end

      Frontend.new(best_driver, best_driver)
    end
  end
end
