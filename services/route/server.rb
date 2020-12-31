require 'sinatra'
require 'json'
require_relative 'client'
require_relative '../config/settings'

module Route
  class Site < Sinatra::Base
    set :bind, '0.0.0.0'
    set :port, ROUTE_PORT
    set :static, true
    set :public_dir, File.expand_path(__dir__)

    get '/route' do
        puts "hit /"
        puts "pickup: #{params[:pickup]}"
        puts "dropoff: #{params[:dropoff]}"
        # puts Route.compute_route(params[:pickup], params[:dropoff])
        { route: "Route compute route #{params[:pickup]}, #{params[:dropoff]}" }.to_json
    end
  end
end
