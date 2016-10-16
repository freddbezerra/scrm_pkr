require "rails_helper"

RSpec.feature "signing users out" do
    
    before do
         
        
        @user = User.create!(email:"example@ex.com",password:"password")
        login_as(@user)
        
        
    end
    
    scenario "Successfull sign user  out" do
        visit "/"
        click_link "Sign out"
        
        expect(page).to have_content("Signed out successfully.")
    end
    
    
end