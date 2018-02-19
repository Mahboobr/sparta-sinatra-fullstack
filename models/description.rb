class Description

  attr_accessor :id, :manufacturer, :model, :year, :engine_size, :power
# uses the column headings you have in your database

  def self.open_connection

      conn = PG.connect( dbname: "vehicles" )

  end

  def save

      conn = Description.open_connection

      if(!self.id)
        sql = "INSERT INTO info ( model , description) VALUES ( '#{self.model}', '#{self.description}')"
      else
        sql = "UPDATE info SET model='#{self.model}', description='#{self.description}' WHERE id = #{self.id}"
      end

      conn.exec(sql)

  end



  def self.all

        conn = self.open_connection

        sql = "SELECT id, model, description FROM info ORDER BY id"

        results = conn.exec(sql)

        info = results.map do |tuple|
            self.hydrate tuple
        end

        info

  end

  def self.find id

        conn = self.open_connection

        sql = "SELECT * FROM info WHERE id = #{id} LIMIT 1"

        cars = conn.exec(sql)

        info = self.hydrate info[0]

        info

  end

  def self.destroy id

      conn = self.open_connection

      sql = "DELETE FROM info where id = #{id}"

      conn.exec(sql)

  end

  def self.hydrate info_data

    description = Description.new

    description.id = info_data['id']
    description.model = info_data['model']
    description.description = info_data['description']

    description

  end

end
