require "rails_helper"
RSpec.feature "Editing Project" do
    
    before do
        @project = Project.create(name: "First Project" ,description: "Simple description of project")
    end
    
    scenario "A user update a project" do
        
        visit "/"
        click_link @project.name 
        click_link "Edit Project"
        
        fill_in "Name" , with: "Update project"
        fill_in "Simple description" , with: "Update description"
        click_button "Update Project"
    
        expect(page).to have_content("Project has been updated")
        expect(page.current_path).to eq(project_path(@project))
    
    end
    
    
     scenario "A user fails to update a project" do
        
        visit "/"
        click_link @project.name
        click_link "Edit Project"
        
        fill_in "Name" , with: ""
        fill_in "Simple Description" , with: "Update description"
        click_button "Update Project"
    
        expect(page).to have_content("Project has not been updated")
        expect(page.current_path).to eq(project_path(@project))
    
    end
    
end