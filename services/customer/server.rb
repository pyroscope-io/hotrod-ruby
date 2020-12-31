require 'sinatra'
require 'json'
require_relative 'client'
require_relative 'db'
require_relative '../config/settings'

module Customer
  class App
    def initialize(args)
        Site.run!
    end
  end

  class Site < Sinatra::Base
    set :bind, '0.0.0.0'
    set :port, CUSTOMER_PORT
    set :static, true
    set :public_dir, File.expand_path(__dir__)

    get '/customer' do
        puts "hit /"
        puts "ID #{params[:id]}"
        puts Database.get_customer_by_id(params[:id])
        { song: "Wake me Up" }.to_json
    end
  end
end

Customer::App.new(ARGV)
