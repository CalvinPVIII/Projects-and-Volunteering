class Project
  attr_accessor :name
  attr_reader :id
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def save
    result = DB.exec("INSERT INTO projects (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  def ==(project_to_compare)
    self.name == project_to_compare.name
  end

  def self.all
    results = DB.exec('SELECT * FROM projects')
    projects = []
    results.each do |result|
      projects.push(Project.new({:name => result.fetch("name"), :id => result.fetch("id").to_i}))
    end
    projects
  end

  def self.find(id)
    result = DB.exec("SELECT * FROM projects WHERE id = #{id}").first
    Project.new({:name => result.fetch("name"), :id => result.fetch("id")})
  end

  def update(attributes)
    @name = attributes.fetch(:name)
    DB.exec("UPDATE projects SET name = '#{@name}' WHERE id = #{@id}")
  end



end
