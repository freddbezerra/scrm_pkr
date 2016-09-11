class ProjectsController < ApplicationController
  def index
  end
  def new
    @project = Project.new
  end
  
  def create 
    @project = Project.new(project_params)
    @project.save
    flash[:success] = "Project has been created"
    redirect_to projects_path
  end
  
  private
    def project_params
      params.require(:project).permit(:name,:description)
    end
end
