class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @status_list = Project.status_list
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to @project, :notice => "Successfully created project."
    else
      render :action => 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project, :notice  => "Successfully updated project."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url, :notice => "Successfully destroyed project."
  end

  def assignment
    @project = Project.find(params[:id])
    @assignments = Assignment.assignment_list
    @users = User.all
  end

  def add_assignment
    @project = Project.find(params[:id])
    @user = User.find(params[:user_id])

    unless params[:assignment].nil?
      params[:assignment].each do |a|
        assignment = Assignment.where(:role => a).where(:user_id => @user.id).first
        if assignment.nil?
          assignment = Assignment.new(:user_id => @user.id, :project_id => @project.id, :role => a)
          assignment.save
        end
      end
      flash[:notice] = "#{@user.username} fue asignado para evaluar el RFP"
    else
      flash[:error] = "Debes escoger al menos un item para evaluar"
    end

    redirect_to :action => "assignment"
  end

  def grade
    @project = Project.find(params[:id])
    @cost_score = CostScore.new
  end
end
