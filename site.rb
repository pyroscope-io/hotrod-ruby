require 'sinatra'
require 'json'
require_relative 'services/customer/client'
require_relative 'services/customer/db'

module App
  class Site < Sinatra::Base
    set :bind, '0.0.0.0'
    set :static, true
    set :public_dir, File.expand_path(__dir__)

    get '/' do
        puts 'hit /'
        puts Customer::Database.get_customer_by_id("123")
        { song: "Wake me Up" }.to_json
    end
  end
end
