class TransactionsController < ApplicationController
  before_action :set_withdraw, only: [:edit, :update, :destroy]
  before_action :set_debt, only: [:new, :edit, :create]

  # GET :debt_id/transactions/
  def index
    @debt = Debt.find(params[:debt_id])
    @transactions = @debt.transactions.by_year
    render :index, layout: false
  end

  # GET :debt_id/transaction/new
  def new  	
    @transaction = Withdraw.new
    render :new, layout: false
  end

  # GET :debt_id/transactions/1/edit
  def edit
  	render :edit, layout: false
  end

  # POST :debt_id/transactions
  # POST :debt_id/transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.debt = @debt
    respond_to do |format|
      if @transaction.save
      	params[:create] = true
        format.html { redirect_to @debt, notice: 'O registro foi salvo com sucesso.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, layout: false, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT :debt_id/transactions/1
  # PATCH/PUT :debt_id/transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'O registro foi salvo com sucesso.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, layout: false, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE :debt_id/transactions/1
  # DELETE :debt_id/transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'O registro foi removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debt
    	@debt = Debt.find(params[:debt_id])
    end

    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:withdraw).permit(:type, :value, :date, :exchange_rate, :debt_id)
    end
end
