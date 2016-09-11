require 'rails_helper'

RSpec.feature "Creating Projects" do

    scenario "A user creates a new project" do
        visit "/" #root
        
        click_link "New Project"
        
        fill_in "Name" , with: "First project"
        fill_in "Simple description" , with: "Teste description"
        click_button "Create Project"
        
        expect(page).to have_content("Project has been created")
        expect(page.current_path).to eq(projects_path)
        
    end

end