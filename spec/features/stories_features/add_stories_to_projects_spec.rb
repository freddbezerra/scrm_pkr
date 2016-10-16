require "rails_helper"
RSpec.feature "Adding stories to a projects" do
    
    
    
    before do
        @user1 = User.create(email: "john@example.com" ,password: "password")
        @user2 = User.create(email: "bob@example.com"  ,password: "password")
        
        @project= Project.create(name: "First Project name" ,
            description: "Simple project description" , user: @user1)
    end
    
    scenario "permit a signed in user owner add stories" do
        login_as(@user1)
        visit "/"
        
        click_link @project.name
        fill_in "New Story" , with: "Difficult storie to do a program"
        click_button "Add Comment"
        
        expect(page).to have_content("Storie has been Created")
        expect(page).to have_content("Difficult storie to do a program")
        expect(current_path).to eq(project_path(@project.stories.last.id)) 
        
        
    end
end