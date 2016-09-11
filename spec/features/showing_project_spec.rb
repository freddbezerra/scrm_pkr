require "rails_helper"

RSpec.feature "Showing a Project" do
    
    
    before do 
        @project = Project.create(name: "The first project" , description: "Description of first project")
    end
    
    scenario "Display individual project details" do
        visit "/"
        
        click_link @project.name
        
        expect(page).to have_content(@project.name)
        expect(page).to have_content(@project.description)
        
        expect(current_path).to eq(project_path(@project))
    end

end
