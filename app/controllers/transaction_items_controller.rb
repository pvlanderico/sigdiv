class TransactionItemsController < ApplicationController  
  before_action :set_transaction, only: [:edit, :update, :destroy]
  before_action :set_debt, only: [:index, :new, :edit, :create, :update]
  before_action :set_transaction_items, only: [:index, :create, :update]

  # GET :debt_id/transactions/
  def index    
    render :index, layout: false
  end

  # GET :debt_id/transaction/new
  def new  	
    type = params[:type].constantize
    @transaction = type.new(debt: @debt)
    @transaction.init if @transaction.type == 'Payment'
    render :new, layout: false
  end

  # GET :debt_id/transactions/1/edit
  def edit
  	render :edit, layout: false
  end

  # POST :debt_id/transactions
  def create
    type = transaction_params[:type].constantize
    @transaction = type.new(transaction_params)
    
    if @transaction.save
      render :index, layout: false, notice: 'O registro foi salvo com sucesso.'        
    else
      render :new, layout: false, status: :unprocessable_entity
    end
  end

  # PATCH/PUT :debt_id/transactions/1
  def update
    if @transaction.update(transaction_params)
      render :index, layout: false, notice: 'O registro foi salvo com sucesso.'        
    else
      render :edit, layout: false, status: :unprocessable_entity        
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

    def set_transaction_items
      @transaction_items = @debt.transaction_items
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:type, 
                                          :value, 
                                          :value_brl, 
                                          :principal, 
                                          :principal_brl, 
                                          :interest, 
                                          :date, 
                                          :debt_id, 
                                          :type, 
                                          :id,
                                          :exchange_rate,
                                          :interest_brl,
                                          payment_charges_attributes: [:id, 
                                                                       :charge_id, 
                                                                       :value,
                                                                       :value_brl])
    end
end
