require 'sinatra'
require 'json'
require_relative 'client'
require_relative 'eta'
require_relative '../config/settings'

module Frontend
  class Site < Sinatra::Base
    set :bind, '0.0.0.0'
    set :port, FRONTEND_PORT
    set :static, true
    set :public_dir, File.expand_path(__dir__)

    get '/dispatch' do
        puts "hit /dispatch"
        puts "customer: #{params[:customer]}"
        puts Eta.get_best_eta(params[:customer])
        { eta: "Frontend dispatch #{params[:customer]}" }.to_json
    end
  end
end
