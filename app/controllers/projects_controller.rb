class ProjectsController < ApplicationController
  
  before_action :authenticate_user! , except:[:index , :show]
  before_filter :set_project, only:[:show,:edit,:update,:destroy]
  
  
  def index
    @projects = Project.all
  end
  def new
    @project = Project.new
  end
  def show 
  end
  
  def edit
  end
  
  def update
  
    if @project.update(project_params)
        flash[:success] = "Project has been updated"
        redirect_to @project
    else
      flash.now[:danger] = "Project has not been updated"
      render :edit
    end
        
  end
  
  def destroy
  
    if @project.destroy
      flash[:sucess] = "Project has been deleted"
      redirect_to  projects_path
    else
      flash.now[:danger] = "Project has not been deleted"
      render :delete
    end
  end
  
  def create 
   @project = current_user.projects.build(project_params)
   #@project = Project.new(project_params)
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
    
    def set_project
     @project = Project.find(params[:id])
    end
end
