class UserStartupsController < ApplicationController
  before_action :set_user_startup, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /user_startups
  # GET /user_startups.json

  def index
   @user_normal=UserNormal.where(user_id:current_user.id)  
   if @user_normal[0].typerole=='admin'
    @user_startups = UserStartup.all
   else
    redirect_to welcome_index_path
   end 
  end 
  # GET /user_startups/1
  # GET /user_startups/1.json
  def show
  end

  # GET /user_startups/new
  def new
    @user_startup = UserStartup.new
  end

  # GET /user_startups/1/edit
  def edit
  end

  # POST /user_startups
  # POST /user_startups.json
  def create
    @user_startup = UserStartup.new(user_startup_params)

    respond_to do |format|
      if @user_startup.save
        format.html { redirect_to @user_startup, notice: 'User startup was successfully created.' }
        format.json { render :show, status: :created, location: @user_startup }
      else
        format.html { render :new }
        format.json { render json: @user_startup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_startups/1
  # PATCH/PUT /user_startups/1.json
  def update
    respond_to do |format|
      if @user_startup.update(user_startup_params)
        format.html { redirect_to @user_startup, notice: 'User startup was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_startup }
      else
        format.html { render :edit }
        format.json { render json: @user_startup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_startups/1
  # DELETE /user_startups/1.json
  def destroy
    @user_startup.destroy
    respond_to do |format|
      format.html { redirect_to user_startups_url, notice: 'User startup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_startup
      @user_startup = UserStartup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_startup_params
      params.require(:user_startup).permit(:name, :status, :user_id)
    end
end
