require 'sinatra'
require 'json'
require_relative 'client'
require_relative 'redis'
require_relative '../config/settings'

module Driver
  class App
    def initialize(args)
        Site.run!
    end
  end

  class Site < Sinatra::Base
    set :bind, '0.0.0.0'
    set :port, DRIVER_PORT
    set :static, true
    set :public_dir, File.expand_path(__dir__)

    get '/find_nearest' do
      content_type :json

      puts "hit /"
      puts "pickup: #{params[:pickup]}"
      drivers = Redis.find_drivers_ids(params[:pickup])
      drivers.map! do |_id|
        driver = Redis.get_driver(_id)
        driver.to_json
      end

      drivers.to_json
    end
  end
end

Driver::App.new(ARGV)
