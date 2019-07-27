class Pokemon
  
  attr_accessor :id, :name, :type, :db

  def initialize (id:, name:, type:, db:)
    @id = id
    @name =name
    @type = type
    @db =db
  
  end
  

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(id, db)
    p_row = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id p_row[0], p_row[1], p_row[2],db)
  end
  
end
