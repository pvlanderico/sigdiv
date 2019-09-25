class MonthReportsController < ApplicationController
  
  def show
    start_date = Date.new(params[:year].to_i, params[:month].to_i)
    end_date = start_date.end_of_month
    @projection_debt = ProjectionDebt.new(Debt.find(params[:debt_id]), start_date, end_date)
    
    render pdf: "relatorio_mensal",
     			 page_size: "A4"    
  end

end
