class HomepageController < ApplicationController
  
  def index
    redirect_to dashboard_path if current_user
  end

  def dashboard
    @bills = Bill.open_bills
    @expenditures = Expenditure.billed
    @overdue_bills = Bill.closed_bills
  end

  def about
  end
  
end
