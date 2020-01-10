class Volunteer
  attr_accessor :name
  attr_reader :id, :project_id
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end

  def ==(volunteer_to_compare)
    self.name == volunteer_to_compare.name
  end

  def self.all
    results = DB.exec('SELECT * FROM volunteers')
    volunteers = []
    results.each do |result|
      volunteers.push(Volunteer.new({:name => result.fetch("name"), :project_id => result.fetch("project_id"), :id => result.fetch("id").to_i}))
    end
    volunteers
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', '#{@project_id}') RETURNING id ;")
    @id = result.first.fetch("id").to_i
  end

  def self.find(id)
    result = DB.exec("SELECT * FROM volunteers WHERE id = #{id}").first
    Volunteer.new({:name => result.fetch("name"), :project_id => result.fetch("project_id"), :id => result.fetch("id")})
  end



end
