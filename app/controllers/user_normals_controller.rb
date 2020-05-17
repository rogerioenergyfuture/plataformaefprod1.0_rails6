class UserNormalsController < ApplicationController
  before_action :set_user_normal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_users, only:[:new,:create]
  before_action :set_usersedit, only:[:edit]  
  before_action :set_companypowers, only: [:new,:edit,:create]
  

  # GET /user_normals
  # GET /user_normals.json
  def index
   @user_normal=UserNormal.where(user_id:current_user.id)  
   if @user_normal[0].typerole=='admin'
     @q = UserNormal.ransack(params[:q].try(:merge, m: params[:combinator]))
     @user_normals = @q.result.all.paginate(:page => params[:page], :per_page => 20).order(name: :asc)
   else
    redirect_to welcome_index_path
   end 
  end

  # GET /user_normals/1
  # GET /user_normals/1.json
  def show
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'
   else
    redirect_to welcome_index_path
   end      
  end

  # GET /user_normals/new
  def new
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'    
    @user_normal = UserNormal.new
   else
    redirect_to welcome_index_path
   end     
  end

  # GET /user_normals/1/edit
  def edit
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin' 
   else
    redirect_to welcome_index_path
   end      
  end
  
  def resetavaliacao
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin' 
    @evaluation=Evaluation.find(params[:id])
    @evaluation.statusbloqueio=0
    @evaluation.favorito=false
    @evaluation.notaavalicacao=""
    @evaluation.notapergunta1=0
    @evaluation.notapergunta2=0
    @evaluation.notapergunta3=0
    @evaluation.notapergunta4=0
    @evaluation.comments=""
    respond_to do |format|
      if @evaluation.save  
       @user_normal=UserNormal.find(params[:other])  
       format.html { render :show, location: @user_normal} 
      end
    end  
   else
    redirect_to welcome_index_path
   end  
  end  
  

  # POST /user_normals
  # POST /user_normals.json
  def create
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'    
    @user_normal = UserNormal.new(user_normal_params)
    respond_to do |format|
      if @user_normal.save
        format.html { redirect_to @user_normal, notice: 'User normal was successfully created.' }
        format.json { render :show, status: :created, location: @user_normal }
        format.js
      else
        format.html { render :new }
        format.json { render json: @user_normal.errors, status: :unprocessable_entity }
        format.js
      end
    end
   else
    redirect_to welcome_index_path
   end     
  end

  # PATCH/PUT /user_normals/1
  # PATCH/PUT /user_normals/1.json
  def update
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'    
    respond_to do |format|
      if @user_normal.update(user_normal_params)
        format.html { redirect_to @user_normal, notice: 'User normal was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_normal }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @user_normal.errors, status: :unprocessable_entity }
        format.js
      end
    end
   else
    redirect_to welcome_index_path
   end     
  end

  # DELETE /user_normals/1
  # DELETE /user_normals/1.json
  def destroy
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'    
    evaluations=Evaluation.where(user_normal_id:@user_normal.id)
    evaluations.each do|evaluation|
     evaluation.destroy
    end 
    user=User.find(@user_normal.user_id)
    @user_normal.destroy
    user.destroy
    respond_to do |format|
      format.html { redirect_to user_normals_url, notice: 'User normal was successfully destroyed.' }
      format.json { head :no_content }
    end
   else
    redirect_to welcome_index_path
   end     
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_normal
      @user_normal = UserNormal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_normal_params
      params.require(:user_normal).permit(:name, :status, :user_id,:companypower_id,:typerole)
    end
    
    def set_users
      users_ocopsid=[]
      users_ocops=UserNormal.all
      users_ocops.each do |user|
        users_ocopsid.push(user.user_id)
      end 
      @users1=User.where.not('id IN (?)', users_ocopsid)
      @users=@users1.where(typeclasse:'User_Normal')
    end 
    
    
    def set_usersedit
      usernormalretirar=UserNormal.where(id:params[:id])
      usernormals_ocopsid=[]
      usernormals_ocops=UserNormal.all
      usernormals_ocops.each do |usernormal|
        usernormals_ocopsid.push(usernormal.user_id)
      end
        usernormals_ocopsid.delete(usernormalretirar[0].user_id)
      @users1=User.where.not('id IN (?)', usernormals_ocopsid)
      @users=@users1.where(typeclasse:'User_Normal')
    end    
    
    def set_companypowers
     @companypowers=Companypower.all 
    end     
end
