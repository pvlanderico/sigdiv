class DebtsController < ApplicationController
  before_action :set_debt, only: [:show, :edit, :update, :destroy]

  # GET /debts
  # GET /debts.json
  def index
    @debts = Debt.search(params[:code_query], params[:name_query], params[:creditor_query], params[:signature_year_query])
  end

  # GET /debts/1
  # GET /debts/1.json
  def show
  end

  # GET /debts/new
  def new
    @debt = Debt.new
    @debt.charges.build
  end

  # GET /debts/1/edit
  def edit
  end

  # POST /debts
  # POST /debts.json
  def create
    @debt = Debt.new(debt_params)

    respond_to do |format|
      if @debt.save
        format.html { redirect_to @debt, notice: 'O registro foi salvo com sucesso.' }
        format.json { render :show, status: :created, location: @debt }
      else
        format.html { render :new }
        format.json { render json: @debt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /debts/1
  # PATCH/PUT /debts/1.json
  def update
    respond_to do |format|
      if @debt.update(debt_params)
        format.html { redirect_to @debt, notice: 'O registro foi salvo com sucesso.' }
        format.json { render :show, status: :ok, location: @debt }
      else
        format.html { render :edit }
        format.json { render json: @debt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debts/1
  # DELETE /debts/1.json
  def destroy
    @debt.destroy
    respond_to do |format|
      format.html { redirect_to debts_url, notice: 'Debt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debt
      @debt = Debt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def debt_params
      params.require(:debt).permit(:code, 
                                   :contract_value_cents, 
                                   :signature_date, 
                                   :creditor_id,
                                   :grace_period, 
                                   :amortization_period, 
                                   :purpose,
                                   :amortization_type,
                                   :amortization_frequency,
                                   :financial_agent_id,
                                   :applicable_legislation,
                                   :legislation_level,
                                   :name,
                                   :category,
                                   :currency,
                                   :notes,
                                   :contract,
                                   charges_attributes: [:id,
                                                        :_destroy,
                                                        :name,
                                                        :base,
                                                        :formula])
    end
end
