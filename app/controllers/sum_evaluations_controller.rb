class SumEvaluationsController < ApplicationController
  before_action :set_sum_evaluation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /sum_evaluations
  # GET /sum_evaluations.json
  def index
   @user_normal=UserNormal.where(user_id:current_user.id)  
   if @user_normal[0].typerole=='admin'
    @sum_evaluations = SumEvaluation.all
   else
    redirect_to welcome_index_path
   end 
  end 
  # GET /sum_evaluations/1
  # GET /sum_evaluations/1.json
  def show
  end

  # GET /sum_evaluations/new
  def new
    @sum_evaluation = SumEvaluation.new
  end

  # GET /sum_evaluations/1/edit
  def edit
  end

  # POST /sum_evaluations
  # POST /sum_evaluations.json
  def create
    @sum_evaluation = SumEvaluation.new(sum_evaluation_params)

    respond_to do |format|
      if @sum_evaluation.save
        format.html { redirect_to @sum_evaluation, notice: 'Sum evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @sum_evaluation }
      else
        format.html { render :new }
        format.json { render json: @sum_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sum_evaluations/1
  # PATCH/PUT /sum_evaluations/1.json
  def update
    respond_to do |format|
      if @sum_evaluation.update(sum_evaluation_params)
        format.html { redirect_to @sum_evaluation, notice: 'Sum evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @sum_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @sum_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sum_evaluations/1
  # DELETE /sum_evaluations/1.json
  def destroy
    @sum_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to sum_evaluations_url, notice: 'Sum evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sum_evaluation
      @sum_evaluation = SumEvaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sum_evaluation_params
      params.require(:sum_evaluation).permit(:kind, :deadline)
    end
end
