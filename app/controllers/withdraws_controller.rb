class WithdrawsController < ApplicationController
  before_action :set_withdraw, only: [:edit, :update, :destroy]
  before_action :set_debt, only: [:new, :edit, :create]

  # GET /withdraws/new
  def new  	
    @withdraw = Withdraw.new
    render :new, layout: false
  end

  # GET /withdraws/1/edit
  def edit
  	render :edit, layout: false
  end

  # POST /withdraws
  # POST /withdraws.json
  def create
    @withdraw = Withdraw.new(withdraw_params)
    @withdraw.debt = @debt
    respond_to do |format|
      if @withdraw.save
        format.html { redirect_to @withdraw, notice: 'Withdraw was successfully created.' }
        format.json { render :show, status: :created, location: @withdraw }
      else
        format.html { render :new, layout: false }
        format.json { render json: @withdraw.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /withdraws/1
  # PATCH/PUT /withdraws/1.json
  def update
    respond_to do |format|
      if @withdraw.update(withdraw_params)
        format.html { redirect_to @withdraw, notice: 'Withdraw was successfully updated.' }
        format.json { render :show, status: :ok, location: @withdraw }
      else
        format.html { render :edit, layout: false }
        format.json { render json: @withdraw.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /withdraws/1
  # DELETE /withdraws/1.json
  def destroy
    @withdraw.destroy
    respond_to do |format|
      format.html { redirect_to withdraws_url, notice: 'Withdraw was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debt
    	@debt = Debt.find(params[:debt_id])
    end

    def set_withdraw
      @withdraw = Withdraw.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def withdraw_params
      params.require(:withdraw).permit(:value, :date, :debt_id)
    end
end
