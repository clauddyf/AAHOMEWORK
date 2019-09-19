require_relative 'plays'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Playwright
  attr_accessor :name, :playwright, :id
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwright")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_name(name)
    data = PlayDBConnection.instance.execute("SELECT name FROM playwright")
    data.map { |datum| Play.new(datum) }
  end

  def new
    @name = options['id']
    @birth_year = options['id']
  end
  
  def create
    raise "#{self} already here big guy" if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?,?,?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id      
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE  
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end



end