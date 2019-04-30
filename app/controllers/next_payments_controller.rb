class NextPaymentsController < ApplicationController
  def index
  	@debts = Debt.next_payments
  end
end
