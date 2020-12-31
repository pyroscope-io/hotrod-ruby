require 'sinatra'
require 'json'
require_relative 'client'
require_relative 'eta'
require_relative '../config/settings'

module Frontend
  class App
    def initialize(args)
        Site.run!
    end
  end
  
  class Site < Sinatra::Base
    set :bind, '0.0.0.0'
    set :port, FRONTEND_PORT
    set :static, true
    set :public_dir, File.expand_path(__dir__)

    # get '/' do
    #   puts "hit base route /"
    #   puts Eta.get_best_eta(params[:customer])
    #   { eta: "Frontend dispatch #{params[:customer]}" }.to_json
    # end

    get '/' do
      puts "hit base route /"
      erb :'/index'
    end

    get '/dispatch' do
        puts "hit /dispatch"
        puts "customer: #{params[:customer]}"
        puts 'best eta', Eta.get_best_eta(params[:customer])
        Eta.get_best_eta(params[:customer])
    end
  end
end

Frontend::App.new(ARGV)
