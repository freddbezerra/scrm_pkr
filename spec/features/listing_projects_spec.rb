require "rails_helper"

RSpec.feature "Listing Projects" do
    
    before do
        @project1 = Project.create(name: "Projeto 1" , description: "Descrição projeto 1")
        @project2 = Project.create(name: "Projeto 2" , description: "Descrição projeto 2")
    end
    
    scenario "List all projects" do
    
        visit "/"
        
        expect(page).to have_content(@project1.name)
        expect(page).to have_content(@project1.description)
        expect(page).to have_content(@project2.name)
        expect(page).to have_content(@project2.description)
        
        expect(page).to have_link(@project1.name)
        expect(page).to have_link(@project2.name)
        
    end
    
end