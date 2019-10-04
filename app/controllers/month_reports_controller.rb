class MonthReportsController < ApplicationController
  
  def show
    start_date = Date.new(params[:year].to_i, params[:month].to_i)
    
    @projection_debt = ProjectionDebt.new(Debt.find(params[:debt_id]), start_date)
    
    render pdf: "relatorio_mensal",
     			 page_size: "A4"    
  end

end
