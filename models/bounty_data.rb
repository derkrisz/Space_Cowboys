require('pg')

class Bounty

  attr_accessor :name, :species, :bounty_value, :homeworld
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @species = options['species']
    @bounty_value = options['bounty_value'].to_i
    @homeworld = options['homeworld']
  end

  def save
    db = PG.connect( {dbname: 'bounties', host: 'localhost'} )
    sql = "INSERT INTO bounties
    (
      name, species, bounty_value, homeworld
    )
    VALUES (
      $1, $2, $3, $4
    )
    RETURNING *
    "
    values = [@name, @species, @bounty_value, @homeworld]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"].to_i
    db.close
  end

  def update
    db = PG.connect( {dbname: 'bounties', host: 'localhost'} )
    sql = "UPDATE bounties
    SET
    (name, species, bounty_value, homeworld) =
    ($1, $2, $3, $4)
    WHERE id = $5
    "
    values = [@name, @species, @bounty_value, @homeworld, @id]
    db.prepare("my_update", sql)
    db.exec_prepared("my_update", values)
    db.close
  end

  def delete
    db = PG.connect( {dbname: 'bounties', host: 'localhost'} )
    sql = "DELETE FROM bounties WHERE id = $1"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close
  end

  def self.name
    db = PG.connect( {dbname: 'bounties', host: 'localhost'} )
    sql = "SELECT name FROM bounties WHERE id = $1"
    values = [@id]
    db.prepare("name", sql)
    db.exec_prepared("name", values)
    db.close
  end
end
