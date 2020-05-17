class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]
  before_action :set_project_usernormal_company, only: [:edit]
  before_action :authenticate_user!

  # GET /evaluations
  # GET /evaluations.json

  
  def index
   @user_normal=UserNormal.where(user_id:current_user.id)  
   if @user_normal[0].typerole=='admin'
    @evaluations = Evaluation.all
   else
    redirect_to welcome_index_path
   end 
  end 

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'
   else
    redirect_to welcome_index_path
   end      
  end

  # GET /evaluations/new
  def new
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'      
    @evaluation = Evaluation.new
   else
    redirect_to welcome_index_path
   end       
  end

  # GET /evaluations/1/edit
  def edit
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='avaliador'
   elsif user_normal[0].typerole=='visualizador'
   else
    redirect_to welcome_index_path
   end      
  end
  

  

  # POST /evaluations
  # POST /evaluations.json
  def create
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'       
    @evaluation = Evaluation.new(evaluation_params)

    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @evaluation }
      else
        format.html { render :new }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
   else
    redirect_to welcome_index_path
   end      
  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update
    respond_to do |format|
       @evaluation.statusbloqueio="Bloqueado"
      if @evaluation.update(evaluation_params)
       @evaluation.notaavalicacao= ((3 * @evaluation.notapergunta1) + (5 * @evaluation.notapergunta2) + (2 * @evaluation.notapergunta3)) / 10 
       puts @evaluation.notaavalicacao 
       @evaluation.save
        #format.html { render :'welcome/allpages?other=projetos' }
        format.html { redirect_to '/welcome/allpages?other=projetos&&status=0&ordem=0&categoria=0'}
        #format.html { redirect_to @evaluations, notice: 'Evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluation }
        format.js #views/evaluations/update.js.erb
      else
        format.html { render :edit }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
        format.js #views/evaluations/update.js.erb
      end
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'       
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: 'Evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
   else
    redirect_to welcome_index_path
   end      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end
    
    def set_project_usernormal_company
      evaluation = Evaluation.find(params[:id])
      @project = Project.find(evaluation.project_id)
      user_normal=UserNormal.where(user_id:current_user.id)
      @user_normal=UserNormal.find(user_normal[0].id)      
      puts @user_normal.name
      @companypower=Companypower.where(id:@user_normal.companypower_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_params
      params.require(:evaluation).permit(:notapergunta1,:notapergunta2,:notapergunta3,:comments,:favorito)
    end
end
