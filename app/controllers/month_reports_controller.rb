class MonthReportsController < ApplicationController
  
  def show
    @projection_debt = ProjectionDebt.new Debt.find params[:debt_id], params[:start_date], params [:end_date]
 
    render pdf: "relatorio_mensal",
     			 page_size: "A4"    
  end

end
