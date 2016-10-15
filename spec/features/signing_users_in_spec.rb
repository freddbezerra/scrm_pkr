require "rails_helper"


RSpec.feature "User sign-in" do

    before do
        @fredd = User.create!(email:"test@test.com",password: "password")        
    end
    
    scenario "with valid credential" do
        visit "/"
        click_link "Sign in"
        
        fill_in "Email" , with: @fredd.email
        fill_in "Password" , with: @fredd.password
        click_button "Log in"
        
        expect(page).to have_content("Signed in successfully.")
        expect(page).to have_content("Signed in as #{@fredd.email}")
        
    end


end