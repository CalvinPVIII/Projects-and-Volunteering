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

get '/projects/:id' do
  @project = Project.find(params[:id].to_i)
  @volunteers = @project.volunteers
  erb(:project)
end

get '/projects/:id/edit' do
  @project = Project.find(params[:id])
  erb(:edit_project)
end

patch '/projects/:id' do
  project = Project.find(params[:id])
  project.update({:name => params[:title], :id => nil})
  redirect to ('/projects/' + params[:id])
end

delete '/projects/:id' do
  project = Project.find(params[:id])
  project.delete
  redirect to ('/')
end

get '/projects/:id/volunteers/:volunteer_id' do
  @project = Project.find(params[:id])
  @volunteer = Volunteer.find(params[:volunteer_id])
  erb(:volunteer)
end

get '/projects/:id/volunteers/:volunteer_id/edit' do
  @project = Project.find(params[:id])
  @volunteer = Volunteer.find(params[:volunteer_id])
  erb(:edit_volunteer)
end

patch '/projects/:id/volunteers/:volunteer_id' do
  volunteer = Volunteer.find(params[:volunteer_id])
  volunteer.update({:name => params[:name], :id => nil})
  redirect to ('/projects/' + params[:id] + '/volunteers/' + params[:volunteer_id] )
end

post '/projects/:id/volunteers/'do
  volunteer = Volunteer.new({:name => params[:name], :project_id => params[:id], :id => nil})
  volunteer.save
  redirect to ("/projects/"+params[:id])
end


delete '/projects/:id/volunteers/:volunteer_id' do
  volunteer = Volunteer.find(params[:volunteer_id])
  volunteer.delete
  redirect to ("/projects/"+params[:id])
end
