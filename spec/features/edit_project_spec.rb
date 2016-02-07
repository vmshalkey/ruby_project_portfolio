require_relative '../spec_helper'

RSpec.describe 'project edit page' do
	before do
		@project = Project.create(name: "Project", description: "Project description")
		visit "/projects/#{@project.id}/edit"
		expect(page.status_code).to eq(200)
	end
	it 'displays information about the project being edited' do
		expect(find_field('Name').value).to eq(@project.name)
		expect(find_field('Description').value).to eq(@project.description)
	end
	it 'has proper form fields' do
		expect(page).to have_field("Name")
		expect(page).to have_field("Description")
	end
end