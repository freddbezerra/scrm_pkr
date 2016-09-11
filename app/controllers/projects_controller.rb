class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  def new
    @project = Project.new
  end
  
  def create 
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project has been created"
      redirect_to projects_path
    else
      flash.now[:danger] = "Project has not been created"
      render :new
    end
  end
  private
    def project_params
      params.require(:project).permit(:name,:description)
    end
end
