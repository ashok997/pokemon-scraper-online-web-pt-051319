class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp

  def initialize (id:, name:, type:, db:, hp: nil)
    @id = id
    @name =name
    @type = type
    @db =db
    @hp = hp
  end
  

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(id, db)
    p_row = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: p_row[0], name: p_row[1], type: p_row[2], db: db, hp: p_row[3])
  end
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id= ?", new_hp, self.id)
  end
end
