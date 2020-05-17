class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy,:accountaltsenha]
  

  # GET /users
  # GET /users.json
  def index
   @user_normal=UserNormal.where(user_id:current_user.id)  
   if @user_normal[0].typerole=='admin'
    @q = User.ransack(params[:q].try(:merge, m: params[:combinator]))
     @users = @q.result.all.paginate(:page => params[:page], :per_page => 20).order(email: :asc)
   else
    redirect_to welcome_index_path
   end 
  end
  


  # GET /users/1
  # GET /users/1.json
  def show
   @user_normal=UserNormal.where(user_id:current_user.id)  
   if @user_normal[0].typerole=='admin' 
   else
    redirect_to welcome_index_path
   end      
  end

  # GET /users/new
  def new
   @user_normal=UserNormal.where(user_id:current_user.id)  
   if @user_normal[0].typerole=='admin'    
    @user = User.new
   else
    redirect_to welcome_index_path
   end     
  end

  # GET /users/1/edit
  def edit
   @user_normal=UserNormal.where(user_id:current_user.id)  
   if @user_normal[0].typerole=='admin'    
  
   else
    redirect_to welcome_index_path
   end     
  end
  
  def accountaltsenha
   @user_normal=UserNormal.where(user_id:current_user.id)  
   if @user_normal[0].typerole=='admin' 
     respond_to do |format|
      format.html { render :accountaltsenha }
     end
   else
     redirect_to welcome_index_path
   end   
  end  
  
def update_password
@user_normal=UserNormal.where(user_id:current_user.id)  
  if @user_normal[0].typerole=='admin'  
   if @user.update(password_params)  
    respond_to do |format|
      format.js
    end
   end
  else
    redirect_to welcome_index_path
  end 
end  






  # POST /users
  # POST /users.json
  def create
  @user_normal=UserNormal.where(user_id:current_user.id)  
  if @user_normal[0].typerole=='admin'     
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        format.js
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js
      end
    end
  else
   redirect_to welcome_index_path
  end     
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
   @user_normal=UserNormal.where(user_id:current_user.id)  
   if @user_normal[0].typerole=='admin'     
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js
      end
    end
   else
    redirect_to welcome_index_path
   end     
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
   @user_normal=UserNormal.where(user_id:current_user.id)  
   if @user_normal[0].typerole=='admin'     
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
   else
    redirect_to welcome_index_path
   end     
  end

  private
    # Use callbacks to share common setup or constraints between actions.

   
    def set_user
     #if params[:id]!='sign_out'
       @user = User.find(params[:id])
     #end  
    end   
   
   
   
def gerasenharandom(len=32, character_set = ["A".."Z", "a".."z", "0".."9"])
  chars = character_set.map{|x| x.is_a?(Range) ? x.to_a : x }.flatten
  Array.new(len){ chars.sample }.join
end 

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email,:typeclasse,:password)
    end
def password_params
    params.require(:user).permit(:password)
end     
    
end
