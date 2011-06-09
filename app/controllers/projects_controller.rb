class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @similars = @project.similars
    @tendencies = @project.calculate_tendencies(@similars)
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
    @status_list = Project.status_list
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
        assignment = Assignment.where(:role => a, :user_id => @user.id, :project_id => @project.id).first
        if assignment.nil?
          assignment = Assignment.new(:user_id => @user.id, :project_id => @project.id, :role => a)
          assignment.init_status
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
    @user = current_user

    @roles = Assignment.assignment_list

    @cost_score = CostScore.where(:user_id => @user.id, :project_id => @project.id).first || CostScore.new
    @tech_score = TechnologyScore.where(:user_id => @user.id, :project_id => @project.id).first || TechnologyScore.new
    @development_score = DevelopmentScore.where(:user_id => @user.id, :project_id => @project.id).first || DevelopmentScore.new
    @legal_score = LegalScore.where(:user_id => @user.id, :project_id => @project.id).first || LegalScore.new
    @risk_score = RiskScore.where(:user_id => @user.id, :project_id => @project.id).first || RiskScore.new
    @opportunity_score = OpportunityScore.where(:user_id => @user.id, :project_id => @project.id).first || OpportunityScore.new
  end

  # Utility function, to help remove some verbosity from method below
  def create_grade clss, params, user_id, project_id, role
    score = clss.where(:user_id => user_id, :project_id => project_id).first
      if(score.nil?)
        score = clss.new(params)
        score.user_id = user_id
        score.project_id = project_id
        score.total_score = score.avg
        score.save
        assignment = Assignment.by_project(project_id).by_user(user_id).by_role(role).first
        assignment.complete
      else
        score.update_attributes(params)
        score.update_attribute(:total_score,score.avg)
      end
  end

  def submit_grade
    @project = Project.find(params[:id])
    @user = current_user

    roles = Assignment.assignment_list

    if(can?(:grade_cost, @project) and params[:cost_score])
      create_grade(CostScore,params[:cost_score],@user.id, @project.id,roles[0])
    end
    if(can?(:grade_technology, @project) and params[:technology_score])
      create_grade(TechnologyScore,params[:technology_score],@user.id, @project.id,roles[1])
    end
    if(can?(:grade_development, @project) and params[:development_score])
      create_grade(DevelopmentScore,params[:development_score],@user.id, @project.id,roles[2])
    end
    if(can?(:grade_legal, @project) and params[:legal_score])
      create_grade(LegalScore,params[:legal_score],@user.id, @project.id,roles[3])
    end
    if(can?(:grade_risks, @project) and params[:risk_score])
      create_grade(RiskScore,params[:risk_score],@user.id, @project.id,roles[4])
    end
    if(can?(:grade_opportunities, @project) and params[:opportunity_score])
      create_grade(OpportunityScore,params[:opportunity_score],@user.id, @project.id,roles[5])
    end
    @project.calculate_score

    flash[:notice] = "Evaluacion exitosa"
    redirect_to :action => :grade
  end

  def pending_users
    @project = Project.find(params[:id])
    @users = @project.pending_users
  end
end
