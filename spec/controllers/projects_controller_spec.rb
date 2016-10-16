require 'rails_helper'
require 'support/macros'

RSpec.describe ProjectsController, type: :controller do

  describe "GET #edit" do
        before do
            @user = User.create!(email: "user@example.com" , password: "password")
        end
        
        context "owner is alowed to edit his articles" do
          it "renders the edit template" do
            login_user @user
             @project = Project.create(name:"Name of first project" ,
              description: "describe of project" ,user: @user)
              get :edit , id: @project
            expect(response).to render_template :edit
          end
        end
        
        context "non-owner is not allowed to edit others projects" do
          it "redirects to the root path" do
              @user2 = User.create(email: "user2@example.com" , password: "password")
              
              login_user @user2
              
              @project = Project.create(name:"Name of first project" ,
                                          description: "describe of project" ,user: @user)
              
              get :edit , id: @project
              expect(response).to redirect_to(root_path)
              message = "You can only edit your own project"
              expect(flash[:danger]).to eq(message)
          end
        end
        
        it "returns http success" do
          get :index
          expect(response).to have_http_status(:success)
        end
  end
  describe "delete #destroy" do
     context "non-owner is not allowed to delete others projects" do
          before do
                 @user = User.create!(email: "user@example.com" , password: "password")
          end
          it "redirects to root path" do
             @user2 = User.create(email: "user2@example.com" , password: "password")
        
            
            login_user @user2
            
            @project = Project.create(name:"Name of first project" ,
                                      description: "describe of project" ,user: @user)
                                      
            delete :destroy , id: @project
            expect(response).to redirect_to(root_path)
            message = "You can only delete your own project"
            expect(flash[:danger]).to eq(message)
          
          end
      end
  end
  
end
