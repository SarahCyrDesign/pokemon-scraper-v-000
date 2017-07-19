class Pokemon
  attr_accessor :name, :type, :db, :id

  @@all = []

  def initialize(id: , name: , type: , db: )
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.all
    @@all
  end

  def self.find(id, database_connection)
    self.all.find {database_connection.execute("SELECT id, name, type FROM pokemon WHERE id = id")}
  end
end
