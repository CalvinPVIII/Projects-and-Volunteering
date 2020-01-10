class Volunteer
  attr_accessor :name
  attr_reader :id, :project_id
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end








end
