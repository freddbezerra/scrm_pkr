require "rails_helper"
RSpec.feature "deleting Project" do

    before do
        @user = User.create!(email: "example@ex.com" , password: "password")
        login_as(@user)
        @project = Project.create(name: "Name of project" , description: "Description of project",user: @user)
    end
    
    scenario "User delete a project" do
        
        visit "/"
        
        click_link @project.name 
        click_link "Delete Project"
        
        expect(page).to have_content("Project has been deleted")
        expect(page.current_path).to eq(projects_path)
    
  
    end
end