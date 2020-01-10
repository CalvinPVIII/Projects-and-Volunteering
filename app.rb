require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker"})


get '/' do
  @projects = Project.all
  erb(:projects)
end

post '/projects' do
  project = Project.new({:name => params[:title], :id => nil})
  project.save
  redirect to ('/')
end
