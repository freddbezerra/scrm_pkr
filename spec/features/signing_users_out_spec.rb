require "rails_helper"

RSpec.feature "signing users out" do
    
    before do
        @user = User.create!(email:"example@ex.com",password:"password")
        
        visit "/"
        
        click_link "Sign in"
        fill_in "Email" , with: @user.email
        fill_in "Password" , with: @user.password
        click_button "Log in"
    end
    
    scenario "Successfull sign user  out" do
        visit "/"
        click_button "Sign out"
        
        expect(page).to have_content("Signed out successfully.")
    end
    
    
end