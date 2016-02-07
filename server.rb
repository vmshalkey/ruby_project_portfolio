require 'sinatra'
require 'active_record'

ENV['SINATRA_ENV'] ||= "developement"

ActiveRecord::Base.establish_connection(
	:adapter => "sqlite3",
	:database => "db/#{ENV['SINATRA_ENV']}.sqlite3"
	# :database => "blog_developement.sqlite3.db"
)
class Project < ActiveRecord::Base
end

get '/' do
	"Welcome to my portfolio"
end

get '/projects' do
	@projects = Project.all
	erb :'projects/index'
end

get '/projects/new' do
	erb :"projects/new"
end

post '/projects' do
	Project.create(name: params[:name], description: params[:description])
	redirect "/projects"
end

get '/projects/:id' do
	@project = Project.find(params[:id])
	erb :"projects/show"
end

get '/projects/:id/edit' do
	@project = Project.find(params[:id])
	erb :"projects/edit"
end

patch '/projects/:id' do
	project = Project.find(params[:id])
	project.update(name: params[:name], description: params[:description])
	redirect "/projects"
end

delete '/projects/:id' do
	project = Project.find(params[:id])
	project.destroy
	redirect "/projects"
end