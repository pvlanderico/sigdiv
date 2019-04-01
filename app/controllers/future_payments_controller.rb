class FuturePaymentsController < ApplicationController    

  # GET :debt_id/future_payments/
  def index
  	@debt = Debt.find(params[:debt_id])
  	@transactions = FuturePayment.list(@debt)
  	
    render :index, layout: false
  end
end