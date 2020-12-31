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
        puts "hit /"
        puts "pickup: #{params[:pickup]}"
        puts Redis.find_drivers_ids(params[:pickup])
        { find_nearest: "Drivers find_nearest #{params[:pickup]}" }.to_json
    end
  end
end

Driver::App.new(ARGV)
