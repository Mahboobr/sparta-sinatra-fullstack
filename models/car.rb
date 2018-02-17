class Car

  attr_accessor :id, :manufacturer, :model, :year, :engine_size, :power
# uses the column headings you have in your database

  def self.open_connection

      conn = PG.connect( dbname: "vehicles" )

  end

  def save

      conn = Car.open_connection

      if(!self.id)
        # Insert a new record in to the database
        sql = "INSERT INTO cars (manufacturer , model , year , engine_size , power) VALUES ( '#{self.manufacturer}', '#{self.model}', '#{self.year}', '#{self.engine_size}', '#{self.power}')"
      else
        # Update an existing one
        sql = "UPDATE cars SET manufacturer='#{self.manufacturer}', model='#{self.model}', year='#{self.year}', engine_size='#{self.engine_size}', power='#{self.power}' WHERE id = #{self.id}"
      end

      conn.exec(sql)

  end



  def self.all

        conn = self.open_connection

        sql = "SELECT id, manufacturer, model, year, engine_size, power FROM cars ORDER BY id"

        results = conn.exec(sql)

        # create an array of post objects
        cars = results.map do |tuple|
            self.hydrate tuple
        end

        cars

  end

  def self.find id

        conn = self.open_connection

        sql = "SELECT * FROM cars WHERE id = #{id} LIMIT 1"

        # PG always returns an array
        cars = conn.exec(sql)

        # bind just the first and return
        car = self.hydrate cars[0]

        car

  end

  def self.destroy id

      conn = self.open_connection

      sql = "DELETE FROM cars where id = #{id}"

      # handle delete here
      conn.exec(sql)

  end

  def self.hydrate car_data

    car = Car.new

    car.id = car_data['id']
    car.manufacturer = car_data['manufacturer']
    car.model = car_data['model']
    car.year = car_data['year']
    car.engine_size = car_data['engine_size']
    car.power = car_data['power']

    car

  end

end
