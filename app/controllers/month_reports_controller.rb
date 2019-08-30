class MonthReportsController < ApplicationController
  
  def show
    @debt = Debt.find params[:debt_id]
  end

end
