require_relative 'site'
require_relative 'services/customer/server'
require_relative 'services/driver/server'
require_relative 'services/frontend/server'
require_relative 'services/route/server'


module App
  class App
    def initialize(args)
        # Do some stuff before launching site.

        # Launch site
        # Site.run!
        # Customer::Site.run!
        # Driver::Site.run!
        Frontend::Site.run!
        # Route::Site.run!
    end
  end
end

App::App.new(ARGV)
# Client::Site.new(ARGV)
