class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /projects
  # GET /projects.json

  def index
   @user_normal=UserNormal.where(user_id:current_user.id)  
   if @user_normal[0].typerole=='admin'
    @projects = Project.all
   else
    redirect_to welcome_index_path
   end 
  end 


  # GET /projects/1
  # GET /projects/1.json
  def show
    user_normal=UserNormal.where(user_id:current_user.id)
    @user_normal=UserNormal.find(user_normal[0].id)
    @evaluation=Evaluation.where(user_normal_id:@user_normal.id,project_id:@project.id)
    @companypower=Companypower.where(id:@user_normal.companypower_id) 
    puts @project.id
    #puts @evaluation[0].id
    puts @companypower[0].id
    puts "EIIIIIIIIIIIIIIIIIIII"
  end

  # GET /projects/new
  def new
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'      
    @project = Project.new
   else
    redirect_to welcome_index_path
   end       
  end

  # GET /projects/1/edit
  def edit
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'
   else
    redirect_to welcome_index_path
   end      
  end

  # POST /projects
  # POST /projects.json
  def create
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'      
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
   else
    redirect_to welcome_index_path
   end      
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'      
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
   else
    redirect_to welcome_index_path
   end      
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'      
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
   else
    redirect_to welcome_index_path
   end      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :title, :user_startup_id)
    end
end
