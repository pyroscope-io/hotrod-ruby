module Frontend
  class BestDriver
    attr_accessor :driver_id, :location

    def initialize(driver_id, eta)
      @driver_id = driver_id
      @eta = eta
    end

    def as_json(options={})
      {
        'driver_id' => @driver_id,
        'eta' => @eta,
      }
    end

    def to_json(*options)
        as_json(*options).to_json(*options)
    end
  end
end
