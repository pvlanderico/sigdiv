class MonthReportsController < ApplicationController
  
  def show
    start_date = Date.new(params[:year].to_i, params[:month].to_i)
    
    @projection_debt = ProjectionDebt.new(Debt.find(params[:debt_id]), start_date)
    @start_date = @projection_debt.start_date
    @future_transactions = @projection_debt.transaction_items 
    
    render pdf: "relatorio_mensal",
     			 page_size: "A4"    
  end

end
