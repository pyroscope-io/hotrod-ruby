require_relative "client"
CUSTOMERS = {
  "123" => Customer::Customer.new(id="123", name="Rachel's Floral Designs", location="115,277"),
  "567" => Customer::Customer.new(id="567", name="Amazing Coffee Roasters", location="211,653"),
  "392" => Customer::Customer.new(id="392", name="Trom Chocolatier", location="577,322"),
  "731" => Customer::Customer.new(id="731", name="Japanese Deserts", location="728,326")
}

module Customer
  class Database
    def self.get_customer_by_id(customer_id)
      if !CUSTOMERS.key?(customer_id)
        puts "no customer with key #{customer_id}"
        puts "customer.keys #{CUSTOMERS.keys}"
        return
      else
        puts "yes customer with key #{customer_id}"
        return CUSTOMERS[customer_id]
      end
    end
  end
end
