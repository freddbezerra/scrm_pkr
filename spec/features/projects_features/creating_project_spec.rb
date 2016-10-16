require 'rails_helper'

RSpec.feature "Creating Projects" do

    before do
        @user = User.create!(email: "example@ex.com" , password: "password")
        login_as(@user)
    end

    scenario "A user creates a new project" do
        visit "/" #root
        
        click_link "New Project"
        
        fill_in "Name" , with: "First project"
        fill_in "Simple description" , with: "Teste description"
        click_button "Create Project"
        
        expect(page).to have_content("Project has been created")
        expect(page.current_path).to eq(projects_path)
        expect(page).to have_content("Owner: #{@user.email}")
        
    end
    
    scenario "User fails to create a new project" do
        visit "/" #root
        
        click_link "New Project"
        
        fill_in "Name" , with: ""
        fill_in "Simple description" , with: ""
        click_button "Create Project"
        
        expect(page).to have_content("Project has not been created")
        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("Description can't be blank")
        
    end

end