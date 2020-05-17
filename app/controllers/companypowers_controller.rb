class CompanypowersController < ApplicationController
  before_action :set_companypower, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /companypowers
  # GET /companypowers.json
  
  def index
   @user_normal=UserNormal.where(user_id:current_user.id)  
   if @user_normal[0].typerole=='admin'
     @q = Companypower.ransack(params[:q].try(:merge, m: params[:combinator]))
     @companypowers = @q.result.all.paginate(:page => params[:page], :per_page => 20).order(name: :asc)
   else
    redirect_to welcome_index_path
   end 
  end  

  # GET /companypowers/1
  # GET /companypowers/1.json
  def show
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'
   else
    redirect_to welcome_index_path
   end      
  end

  # GET /companypowers/new
  def new
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'      
    @companypower = Companypower.new
   else
    redirect_to welcome_index_path
   end       
  end

  # GET /companypowers/1/edit
  def edit
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'
   else
    redirect_to welcome_index_path
   end      
  end

  # POST /companypowers
  # POST /companypowers.json
  def create
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'     
    @companypower = Companypower.new(companypower_params)
    respond_to do |format|
      if @companypower.save
        format.html { redirect_to @companypower, notice: 'Companypower was successfully created.' }
        format.json { render :show, status: :created, location: @companypower }
      else
        format.html { render :new }
        format.json { render json: @companypower.errors, status: :unprocessable_entity }
      end
    end
   else
    redirect_to welcome_index_path
   end       
  end

  # PATCH/PUT /companypowers/1
  # PATCH/PUT /companypowers/1.json
  def update
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'     
    respond_to do |format|
      if @companypower.update(companypower_params)
        format.html { redirect_to @companypower, notice: 'Companypower was successfully updated.' }
        format.json { render :show, status: :ok, location: @companypower }
      else
        format.html { render :edit }
        format.json { render json: @companypower.errors, status: :unprocessable_entity }
      end
    end
   else
    redirect_to welcome_index_path
   end       
  end

  # DELETE /companypowers/1
  # DELETE /companypowers/1.json
  def destroy
   user_normal=UserNormal.where(user_id:current_user.id)  
   if user_normal[0].typerole=='admin'     
    @companypower.destroy
    respond_to do |format|
      format.html { redirect_to companypowers_url, notice: 'Companypower was successfully destroyed.' }
      format.json { head :no_content }
    end
   else
    redirect_to welcome_index_path
   end       
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_companypower
      @companypower = Companypower.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def companypower_params
      params.require(:companypower).permit(:name, :category, :status, :responsibleemail)
    end
end
